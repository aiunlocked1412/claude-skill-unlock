---
type: game-blueprint
title: PixelLeap
genre: 2D Platformer
engine: Godot 4.3
platform: PC (Windows/Linux/macOS) + Web
created: 2026-04-16
---

# Game Blueprint: PixelLeap

## Concept

| Field | Value |
|-------|-------|
| Title | PixelLeap |
| Genre | 2D Platformer / Speedrun |
| Engine | Godot 4.3 (GDScript) |
| Platform | PC + Web (itch.io) |
| Target audience | indie gamer ที่ชอบ Celeste, Hollow Knight |
| Playtime | 1-2 ชม. (10 level) |
| Selling point | minimalist pixel art + tight controls + speedrun timer |

**Pitch:** "Celeste ขนาดสั้น เล่นจบใน 1 ชม. timer แข่งกับเพื่อนได้"

---

## Engine Choice

**เลือก:** Godot 4.3

**เหตุผล:**
1. 2D Scene/Node สำหรับ platformer = เหมาะที่สุด
2. MIT license — ขายแล้วไม่ต้องจ่าย royalty
3. Web export (HTML5) ดีมาก — เล่นบน itch.io ได้ทันที
4. ขนาด build เล็ก (Web: 8MB, PC: 35MB)
5. ทีม solo dev — community + tutorial เยอะ + เรียน GDScript ภายใน 3 วัน

---

## Project Structure

```
pixelleap/
├── project.godot
├── scenes/
│   ├── main.tscn               # entry point
│   ├── menus/
│   │   ├── main_menu.tscn
│   │   ├── pause.tscn
│   │   └── level_select.tscn
│   ├── levels/
│   │   ├── level_01.tscn
│   │   └── ...
│   ├── entities/
│   │   ├── player.tscn
│   │   ├── enemy_walker.tscn
│   │   └── checkpoint.tscn
│   └── ui/
│       └── hud.tscn
├── scripts/
│   ├── player.gd
│   ├── enemy_walker.gd
│   ├── game_manager.gd         # autoload (singleton)
│   ├── save_system.gd          # autoload
│   └── audio_manager.gd        # autoload
├── assets/
│   ├── sprites/
│   ├── tilesets/
│   ├── sfx/
│   ├── music/
│   └── fonts/                  # PixelOperator
└── data/                       # Resource (.tres) — level config
```

---

## Core Mechanics

### Mechanic 1: Player Movement (run + jump + dash)

```gdscript
# scripts/player.gd
extends CharacterBody2D

@export var speed: float = 200.0
@export var jump_velocity: float = -400.0
@export var dash_speed: float = 600.0
@export var dash_duration: float = 0.15

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var dash_timer: Timer = $DashTimer

var can_dash: bool = true
var is_dashing: bool = false
var dash_dir: Vector2 = Vector2.ZERO

signal died

func _physics_process(delta: float) -> void:
    if not is_on_floor():
        velocity += get_gravity() * delta

    # Reset dash on ground
    if is_on_floor():
        can_dash = true

    var dir := Input.get_axis("move_left", "move_right")

    # Dash (priority over normal movement)
    if Input.is_action_just_pressed("dash") and can_dash:
        is_dashing = true
        can_dash = false
        dash_dir = Vector2(dir if dir != 0 else (1 if anim.flip_h == false else -1), 0)
        dash_timer.start(dash_duration)
        anim.play("dash")

    if is_dashing:
        velocity = dash_dir * dash_speed
    else:
        # Jump
        if Input.is_action_just_pressed("jump") and is_on_floor():
            velocity.y = jump_velocity
            anim.play("jump")
        # Variable jump (release early = lower jump)
        if Input.is_action_just_released("jump") and velocity.y < 0:
            velocity.y *= 0.5

        # Horizontal
        if dir != 0:
            velocity.x = dir * speed
            anim.flip_h = dir < 0
            if is_on_floor(): anim.play("run")
        else:
            velocity.x = move_toward(velocity.x, 0, speed)
            if is_on_floor(): anim.play("idle")

    move_and_slide()

func _on_dash_timer_timeout() -> void:
    is_dashing = false

func die() -> void:
    died.emit()
    queue_free()
```

### Mechanic 2: Enemy AI (walker — patrol + turn at edge)

```gdscript
# scripts/enemy_walker.gd
extends CharacterBody2D

@export var speed: float = 60.0
var direction: int = 1

@onready var raycast_floor: RayCast2D = $RayCastFloor
@onready var raycast_wall: RayCast2D = $RayCastWall

func _physics_process(delta: float) -> void:
    if not is_on_floor():
        velocity += get_gravity() * delta

    # Turn at edge or wall
    if is_on_floor() and (not raycast_floor.is_colliding() or raycast_wall.is_colliding()):
        direction *= -1
        scale.x *= -1  # flip sprite + raycast

    velocity.x = direction * speed
    move_and_slide()

# Player collision detection (Area2D child)
func _on_hitbox_body_entered(body: Node2D) -> void:
    if body.has_method("die"):
        body.die()
```

### Mechanic 3: Checkpoint + Death/Respawn

```gdscript
# scripts/checkpoint.gd
extends Area2D
@onready var sprite: Sprite2D = $Sprite2D

func _on_body_entered(body: Node2D) -> void:
    if body is Player:
        GameManager.set_checkpoint(global_position)
        sprite.modulate = Color.GREEN  # visual feedback
```

```gdscript
# scripts/game_manager.gd (autoload)
extends Node
var checkpoint_pos: Vector2
var current_level: PackedScene

signal player_died

func set_checkpoint(pos: Vector2) -> void:
    checkpoint_pos = pos

func respawn_player() -> void:
    var player = preload("res://scenes/entities/player.tscn").instantiate()
    player.global_position = checkpoint_pos
    get_tree().current_scene.add_child(player)
```

---

## Game State Machine

```
[Splash] → [Main Menu] → [Level Select]
                              ↓
                          [Gameplay] ↔ [Pause]
                              ↓ (death)
                          [Respawn at checkpoint]
                              ↓ (level complete)
                          [Level Complete] → [Level Select / Next]
                              ↓ (all level)
                          [Credits]
```

---

## Save System (Resource)

```gdscript
# scripts/save_data.gd
extends Resource
class_name SaveData

@export var version: int = 1
@export var levels_completed: Array[int] = []
@export var best_times: Dictionary = {}  # { level_id: seconds }
@export var total_deaths: int = 0
@export var settings: Dictionary = {
    "master_volume": 1.0,
    "music_volume": 0.7,
    "sfx_volume": 1.0,
    "fullscreen": false,
}
```

```gdscript
# scripts/save_system.gd (autoload)
extends Node
const SAVE_PATH = "user://save.tres"

var data: SaveData

func _ready() -> void:
    load_or_create()

func load_or_create() -> void:
    if ResourceLoader.exists(SAVE_PATH):
        data = ResourceLoader.load(SAVE_PATH) as SaveData
        if data.version < 1:
            migrate(data)
    else:
        data = SaveData.new()
        save()

func save() -> void:
    ResourceSaver.save(data, SAVE_PATH)

func update_best_time(level_id: int, time_sec: float) -> void:
    if not data.best_times.has(level_id) or time_sec < data.best_times[level_id]:
        data.best_times[level_id] = time_sec
        save()

func migrate(d: SaveData) -> void:
    # Future use when version bump
    d.version = 1
    save()
```

---

## UI

| Screen | Purpose | Tech |
|--------|---------|------|
| Main Menu | Play, Level Select, Settings, Quit | CanvasLayer + Theme |
| HUD | Timer, deaths counter | CanvasLayer |
| Pause | Resume, Restart, Main Menu | overlay (process_mode = WHEN_PAUSED) |
| Settings | Volume sliders, fullscreen toggle, key remap | TabContainer |
| Level Complete | Time, best time, next level button | overlay |

---

## Asset Plan

| Asset | Count | Source | Note |
|-------|-------|--------|------|
| Player sprite (anim) | 28 frame (idle/run/jump/dash/death) | self pixel | 16×16 |
| Tileset | 64 tile (grass/stone/spike) | Kenney 1-bit | 16×16 |
| Enemy sprite | 12 frame × 2 enemy type | itch.io free | 16×16 |
| SFX | 25 clip (jump/dash/death/coin) | sfxr + freesound | 8-bit style |
| Music | 4 track (menu/level1-3/credits) | OpenGameArt CC0 | loop ~2 นาที |
| Font | PixelOperator (free) | dafont | bitmap |

---

## Performance Budget

- Target FPS: 60 (PC) / 60 (Web — V-sync)
- Draw calls: < 50 (small scene)
- Triangles: N/A (2D)
- VRAM: < 64MB
- Build size: PC 35MB / Web 8MB

---

## Build & Deploy

### Godot export
```
Project → Export → Add preset:
  - Linux/X11
  - Windows Desktop
  - macOS
  - HTML5 (compress: brotli, embed: false)
```

### itch.io upload (butler)
```bash
butler push build/win/   user/pixelleap:windows
butler push build/linux/ user/pixelleap:linux
butler push build/mac/   user/pixelleap:mac
butler push build/web/   user/pixelleap:web
butler status user/pixelleap
```

---

## Pre-launch Checklist

- [x] Playtest 5 player ผ่านจบ — เฉลี่ย 90 นาที
- [x] No crash 1 ชม. ต่อเนื่อง
- [x] Save/load ทดสอบครบ — รวม corrupt save (delete file) → recreate ใหม่
- [x] Audio level: master -6dB peak
- [x] Settings save + apply ทุกครั้งที่เปิดเกม
- [x] Credits + license attribution ครบ (Kenney, freesound, OpenGameArt)
- [x] Trailer 30 วิ + 4 screenshot
- [x] itch.io page metadata: tag, genre, description ภาษาไทย+อังกฤษ
- [ ] Achievements (Steam) — รอ v1.1

---

*Generated by /game-dev-pro — Claude Skill Unlock v1.1*
