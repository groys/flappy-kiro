# Flappy Kiro

A Flappy Bird-style arcade game featuring Ghosty, a ghost character navigating through walls with random gaps.

## Requirements

- **Godot Engine 4.2 or later**
- Download from: https://godotengine.org/download

## How to Run

1. **Install Godot 4.2+**
2. **Open Godot Engine**
3. **Import Project**:
   - Click "Import"
   - Navigate to the `flappy-kiro` directory
   - Select `project.godot`
   - Click "Import & Edit"
4. **Run the Game**:
   - Press **F5** or click the **Play** button in the top-right corner

## How to Play

- **Objective**: Navigate Ghosty through wall gaps to score points
- **Controls**: Press **SPACEBAR** to make Ghosty jump/ascend
- **Gameplay**:
  - Ghosty automatically moves right and falls due to gravity
  - Press spacebar to jump upward
  - Pass through wall gaps to score 1 point each
  - Game speed increases as your score increases
  - Avoid hitting walls or the ground
  - Game ends on collision

## Features

✅ **Core Gameplay**
- Gravity-based physics
- One-button jump control
- Procedural wall generation with random gaps
- Collision detection

✅ **Scoring System**
- Real-time score display
- High score tracking
- Leaderboard with top 10 scores
- Persistent storage (saves between sessions)

✅ **Game Flow**
- Start screen with prompt
- Active gameplay
- Game over screen with leaderboard
- Restart functionality

✅ **Progressive Difficulty**
- Game speed increases by 5% for every 5 points scored
- Provides escalating challenge

✅ **Audio** (Placeholders)
- Jump sound effect (when spacebar pressed)
- Collision sound effect (when game over)
- Score sound effect (when passing through gap)
- *Note: Audio nodes are set up but need sound files*

✅ **Visual Design**
- Simple colored shapes (placeholders for pixel art)
- Clear visual distinction between elements
- Responsive window sizing

✅ **Performance**
- 60 FPS target
- Responsive controls with minimal lag

## Project Structure

```
flappy-kiro/
├── project.godot          # Godot project configuration
├── scenes/                # Game scenes
│   ├── game.tscn         # Main game scene
│   ├── wall.tscn         # Wall prefab
│   ├── game_over.tscn    # Game over screen
│   └── main_menu.tscn    # Main menu (unused)
├── scripts/               # GDScript files
│   ├── player.gd         # Player controller
│   ├── wall.gd           # Wall behavior
│   ├── wall_spawner.gd   # Wall generation
│   ├── game_manager.gd   # Game state management
│   ├── score_manager.gd  # Scoring system
│   ├── leaderboard.gd    # Leaderboard persistence
│   ├── score_area.gd     # Score detection
│   ├── game_over_ui.gd   # Game over UI
│   └── score_label.gd    # Score display
├── assets/                # Game assets
│   ├── sprites/          # Placeholder notes for sprites
│   └── sounds/           # Placeholder notes for sounds
└── README.md             # This file
```

## Adding Custom Assets

### Pixel Art Sprites

**Ghosty Character** (`assets/sprites/ghosty.png`):
- Size: 40x40 pixels
- Style: Simple ghost design
- Format: PNG with transparency

**Wall Texture** (`assets/sprites/wall.png`):
- Size: 80x600 pixels
- Style: Brick, pipe, or simple pattern
- Format: PNG

To use sprites:
1. Create/download pixel art images
2. Place in `assets/sprites/` directory
3. In Godot, replace ColorRect nodes with Sprite2D nodes
4. Assign textures to Sprite2D nodes

### Sound Effects

**Required Sounds**:
- `assets/sounds/jump.wav` - Jump/flap sound (0.1-0.2s)
- `assets/sounds/collision.wav` - Crash/thud sound (0.2-0.3s)
- `assets/sounds/score.wav` - Ding/coin sound (0.1-0.2s)

**Sound Resources**:
- Generate: sfxr, bfxr, ChipTone
- Download: freesound.org, OpenGameArt.org
- Format: WAV or OGG

To add sounds:
1. Place sound files in `assets/sounds/` directory
2. In Godot, select AudioStreamPlayer nodes
3. Assign sound files to the Stream property

## Game Configuration

Edit these constants in scripts to adjust gameplay:

**Player** (`scripts/player.gd`):
- `GRAVITY = 980.0` - Falling speed
- `JUMP_VELOCITY = -400.0` - Jump strength
- `MOVE_SPEED = 200.0` - Horizontal speed

**Walls** (`scripts/wall_spawner.gd`):
- `SPAWN_INTERVAL = 2.0` - Time between wall pairs (seconds)
- `GAP_SIZE = 200` - Height of gap (pixels)
- `MIN_GAP_Y = 150` - Minimum gap position
- `MAX_GAP_Y = 450` - Maximum gap position

**Difficulty** (`scripts/game_manager.gd`):
- Speed increase formula: `1.0 + (score / 5) * 0.05`
- Modify in `increase_difficulty()` function

## Save Data Location

Game data is saved in Godot's user directory:
- **Windows**: `%APPDATA%\Godot\app_userdata\Flappy Kiro\`
- **macOS**: `~/Library/Application Support/Godot/app_userdata/Flappy Kiro/`
- **Linux**: `~/.local/share/godot/app_userdata/Flappy Kiro/`

Files:
- `high_score.save` - High score data
- `leaderboard.save` - Top 10 scores with dates

## Troubleshooting

**Game won't start**:
- Ensure Godot 4.2+ is installed
- Check that `project.godot` is in the correct directory

**No audio**:
- Audio nodes are set up but need sound files
- Add .wav or .ogg files to `assets/sounds/` directory
- Assign files to AudioStreamPlayer nodes in Godot editor

**Performance issues**:
- Check FPS in Godot debug overlay (F3)
- Reduce window size if needed
- Ensure no other heavy applications are running

**Leaderboard not saving**:
- Check file permissions in user data directory
- Verify Godot has write access

## Development Notes

- Built with Godot 4.2
- Uses GDScript for all game logic
- No external dependencies required
- Simple architecture for easy modification
- All game logic is in individual script files

## License

This is a simple game project created for learning purposes.

## Credits

Game concept inspired by Flappy Bird by Dong Nguyen.
