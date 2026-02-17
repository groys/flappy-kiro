# Flappy Kiro - Web Version

## Quick Start (Web-Based IDE)

Simply open `index.html` in your browser or use your IDE's preview feature.

### Testing in Web-Based IDE

**Most web IDEs have a "Preview" or "Open with Live Server" feature:**

1. **VS Code Online / GitHub Codespaces**: 
   - Right-click `index.html` → "Open with Live Server"
   - Or use the preview button in the top-right

2. **Replit**:
   - Click the "Run" button
   - Or open the Webview panel

3. **CodeSandbox**:
   - Automatically previews in the right panel

4. **Gitpod**:
   - Click "Open Preview" or "Open Browser"

5. **StackBlitz**:
   - Automatically shows preview

### Local Testing

If you have the files locally:
```bash
# Option 1: Python
python3 -m http.server 8000
# Then open: http://localhost:8000/index.html

# Option 2: Node.js
npx serve
# Then open the URL shown

# Option 3: Just open the file
# Double-click index.html (works in most browsers)
```

## How to Play

- **Start**: Press SPACEBAR
- **Jump**: Press SPACEBAR
- **Restart**: Press SPACEBAR (after game over)

## Features

✅ All core gameplay mechanics  
✅ Gravity and jump physics  
✅ Procedural wall generation with random gaps  
✅ Collision detection  
✅ Real-time scoring  
✅ High score tracking (localStorage)  
✅ Leaderboard (top 10, persistent)  
✅ Progressive difficulty (speed increases)  
✅ Game state management  
✅ Responsive to window size  

## Browser Compatibility

Works in all modern browsers:
- Chrome/Edge (recommended)
- Firefox
- Safari
- Opera

## Differences from Godot Version

**HTML5 Version** (this file):
- ✅ Runs directly in browser
- ✅ No installation needed
- ✅ Works in web-based IDEs
- ✅ Simpler codebase
- ❌ No audio (can be added)
- ❌ Basic graphics (colored rectangles)

**Godot Version** (in `flappy-kiro/` directory):
- ✅ Full game engine features
- ✅ Better performance
- ✅ Audio system ready
- ✅ Easier to add pixel art
- ❌ Requires Godot installation
- ❌ Can't run in web IDE directly

## Adding Audio to HTML5 Version

To add sound effects, add these before the closing `</body>` tag:

```html
<audio id="jumpSound" src="jump.wav" preload="auto"></audio>
<audio id="collisionSound" src="collision.wav" preload="auto"></audio>
<audio id="scoreSound" src="score.wav" preload="auto"></audio>
```

Then play sounds in the code:
```javascript
document.getElementById('jumpSound').play();
```

## Customization

Edit constants in the JavaScript section:

```javascript
const GRAVITY = 0.6;           // Falling speed
const JUMP_STRENGTH = -10;     // Jump power
const WALL_SPEED_BASE = 3;     // Base scroll speed
const GAP_SIZE = 200;          // Gap height
```

## Storage

Game data is saved in browser localStorage:
- `flappyKiroHighScore` - Highest score
- `flappyKiroLeaderboard` - Top 10 scores with dates

Clear data: Open browser console and run:
```javascript
localStorage.clear();
```
