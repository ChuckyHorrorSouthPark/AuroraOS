# AuroraOS 1.0 - UI Design System

## Design Language

### Philosophy

AuroraOS UI combines the timeless elegance of macOS Sierra with modern 2026 design principles:

- **Clarity**: Clean, uncluttered interfaces
- **Consistency**: Unified visual language across all applications
- **Depth**: Subtle layering and shadows
- **Motion**: Purposeful, delightful animations
- **Accessibility**: Inclusive design for all users

---

## Visual Identity

### Color Palette

#### Light Mode
```
Background:           #FFFFFF
Secondary Background: #F5F5F5
Tertiary Background:  #EEEEEE
Text Primary:         #000000 (opacity: 100%)
Text Secondary:       #666666 (opacity: 100%)
Text Tertiary:        #999999 (opacity: 66%)
Border:               #D0D0D0
Accent:               #0084FF (Aurora Blue)
Accent Alt:           #FF6B35 (Aurora Orange)
Success:              #34C759
Warning:              #FF9500
Error:                #FF3B30
```

#### Dark Mode
```
Background:           #1D1D1D
Secondary Background: #2A2A2A
Tertiary Background:  #383838
Text Primary:         #FFFFFF (opacity: 100%)
Text Secondary:       #A0A0A0 (opacity: 100%)
Text Tertiary:        #606060 (opacity: 66%)
Border:               #3C3C3C
Accent:               #0A84FF (Aurora Blue)
Accent Alt:           #FF8C42 (Aurora Orange)
Success:              #30B84B
Warning:              #FF9500
Error:                #FF453A
```

#### Aurora Accent Colors
- **Primary Accent**: #0084FF (Aurora Blue) - 60° from true blue, inspired by Aurora Borealis
- **Secondary Accent**: #FF6B35 (Aurora Orange) - Complementary warm tone
- **Tertiary Accent**: #00D084 (Aurora Green) - Tech-forward green
- **Quaternary Accent**: #A78BFA (Aurora Purple) - Sophisticated purple

### Typography

**System Fonts**:
- **San Francisco Pro** (primary system font)
- **Monospace**: SF Mono (terminal, code)
- **Serif**: Lyon (display, headings)

**Font Sizes**:
```
Display Large:     32pt  (weight: 700)
Display Medium:    28pt  (weight: 600)
Display Small:     24pt  (weight: 600)

Heading Large:     20pt  (weight: 600)
Heading Medium:    17pt  (weight: 600)
Heading Small:     15pt  (weight: 600)

Body Large:        16pt  (weight: 400)
Body Medium:       15pt  (weight: 400)
Body Small:        14pt  (weight: 400)

Caption Large:     12pt  (weight: 500)
Caption Medium:    11pt  (weight: 400)
Caption Small:     10pt  (weight: 400)

Monospace Code:    13pt  (weight: 400)
```

**Line Heights**:
- Display: 1.2
- Heading: 1.25
- Body: 1.5
- Caption: 1.4

### Spacing Scale

```
0px   - 0
2px   - xxs
4px   - xs
8px   - sm
12px  - md
16px  - lg
20px  - xl
24px  - 2xl
32px  - 3xl
40px  - 4xl
48px  - 5xl
```

### Shadows

**Elevation System**:
```
Elevation 0:  No shadow
Elevation 1:  0 1px 2px rgba(0,0,0,0.1)
Elevation 2:  0 2px 4px rgba(0,0,0,0.1), 0 4px 8px rgba(0,0,0,0.08)
Elevation 3:  0 4px 8px rgba(0,0,0,0.12), 0 8px 16px rgba(0,0,0,0.1)
Elevation 4:  0 8px 16px rgba(0,0,0,0.15), 0 16px 32px rgba(0,0,0,0.12)
Elevation 5:  0 12px 24px rgba(0,0,0,0.15), 0 24px 48px rgba(0,0,0,0.12)
```

### Border Radius

```
None:     0px
Small:    4px
Medium:   8px
Large:    12px
Full:     9999px (pill-shaped)
```

---

## Desktop Environment

### Desktop Layout

**Components**:
1. **Wallpaper** - Dynamic, theme-aware background
2. **Desktop Icons** - Draggable files and folders
3. **Menu Bar** - Top system bar
4. **Dock** - Application launcher and window management
5. **Widgets** - Resizable information panels
6. **Desktop Right-Click Menu** - Context menu

### Wallpapers

**Default Collection**:
- Aurora Light (day cycle)
- Aurora Dark (night cycle)
- Aurora Minimal (geometric)
- Aurora Mountains (landscape)
- Aurora Space (cosmic)
- Aurora Abstract (modern art)
- Aurora Gradient (minimalist)
- Aurora Nostalgia (retro Sierra-inspired)

**Dynamic Wallpaper Scheduling**:
- Light wallpaper: 6 AM - 6 PM
- Dark wallpaper: 6 PM - 6 AM
- Smooth transitions at dawn/dusk

---

## Menu Bar

### Layout

```
┌─────────────────────────────────────────────────────────────────────┐
│ 🍎 Aurora  File  Edit  View  Window  Help  │ Wi-Fi 🔋 Volume ⏰ 🔍 👤 │
└─────────────────────────────────────────────────────────────────────┘
```

### Left Side

**Aurora Menu**:
- About AuroraOS
- System Preferences
- System Report
- App Store
- Recent Items
- Favorites
- Restart/Shutdown

**Application Menu**:
- File
- Edit
- View
- Window
- Help
- (Context-specific items)

### Right Side (Status Area)

**Status Indicators** (left to right):
1. **Wi-Fi** - Signal strength indicator
2. **Bluetooth** - Connected devices
3. **Battery** - Percentage and time remaining
4. **Volume** - Current level with quick access
5. **AI Assistant** - Nova indicator
6. **Cloud Sync** - Sync status indicator
7. **Screen Recording** - Recording indicator (if active)
8. **Notifications** - Unread count badge
9. **Clock** - Time in 12/24 hour format
10. **Search** - Quick access to Aurora Search
11. **User** - Profile menu

### Menu Bar Features

- **Translucency**: 15% opacity background
- **Auto-hide**: Optional per user preference
- **Dynamic Sizing**: Expands/contracts based on content
- **Dark Mode**: Inverted colors in dark mode
- **Click-through**: Allows interaction with desktop behind

---

## Dock

### Default Dock Applications

```
┌────────────────────────────────────────────────────────────────────┐
│ ⊡ │ 🔍 │ 🧭 │ ✉️ │ 📅 │ 📝 │ 📚 │ 📊 │ 🎨 │ 📸 │ 🎵 │ 🎮 │ 🛍️ │ ⚙️ │ 🗑️ │
└────────────────────────────────────────────────────────────────────┘
```

**Applications** (in order):
1. **Pathfinder** - File manager (Sierra-styled)
2. **Safari** - Web browser
3. **Pulse** - Email and messaging
4. **Calendar** - Calendar management
5. **Notes** - Quick notes
6. **Scholar** - Education tools
7. **Photos** - Photo library and editor
8. **Music** - Music player
9. **Game Center** - Gaming hub
10. **App Store** - Application marketplace
11. **Settings** - System preferences
12. **Trash** - Deleted files

### Dock Features

**Magnification**:
- Hover over dock icon to enlarge
- Scale: 1.0x (normal) to 1.5x (maximum)
- Smooth animation (0.3s duration)

**Launch Animations**:
- Bounce animation on launch
- Pulse when receiving attention
- Fade when minimizing

**Indicators**:
- Blue dot under running apps
- Badge with count for notifications
- Progress indicator for downloads

**Customization**:
- Drag/drop to reorder
- Right-click to open folders as stacks
- Add/remove applications
- Adjust size (16px - 128px)
- Position (bottom/left/right)
- Auto-hide toggle

**Folder Stacks**:
- Spring-loaded folder open
- Grid or fan view
- Recent items only option
- Quick preview on hover

---

## Component Library

### Buttons

**Types**:
1. **Primary Button** - Main action, filled with accent color
2. **Secondary Button** - Alternative action, outlined style
3. **Tertiary Button** - Subtle action, text only
4. **Destructive Button** - Dangerous action, red color

**States**:
- Default (normal)
- Hover (brightness +10%)
- Active/Pressed (brightness -10%)
- Disabled (opacity 50%)
- Loading (spinner indicator)

**Button Example**:
```
Primary:   ┌──────────────┐
           │ Continue     │  (Aurora Blue background)
           └──────────────┘

Secondary: ┌──────────────┐
           │ Cancel       │  (Border, transparent)
           └──────────────┘

Destructive:┌──────────────┐
            │ Delete       │  (Red background)
            └──────────────┘
```

### Text Fields

**States**:
- Empty
- Focused (blue border)
- Filled
- Error (red border)
- Disabled

**Features**:
- Placeholder text
- Character counter
- Helper text
- Password visibility toggle

### Checkboxes & Radio Buttons

**Checkbox**:
- ☐ Unchecked
- ☑ Checked
- ⊟ Indeterminate
- ☑ Disabled

**Radio Button**:
- ○ Unselected
- ◉ Selected
- ○ Disabled

### Toggle Switch

```
├─●─┤  OFF    or    ├─────●┤  ON
```

**Animation**: Smooth 0.3s transition

### Sliders

```
├─●─────┤  Value indicator
```

**Features**:
- Numeric display
- Min/max values
- Step increments
- Discrete steps option

### Dropdowns & Menus

**Dropdown**:
```
┌─────────────────────┐
│ Select Option   ▼   │
└─────────────────────┘

Expanded:
┌─────────────────────┐
│ Option 1            │
│ Option 2 (selected) │
│ Option 3            │
└─────────────────────┘
```

### Modal Dialogs

**Structure**:
```
┌────────────────────────────────────┐
│ Dialog Title                     ✕ │
├────────────────────────────────────┤
│                                    │
│ Dialog content goes here...        │
│                                    │
├────────────────────────────────────┤
│ [Cancel]                 [Confirm] │
└────────────────────────────────────┘
```

**Types**:
- Alert (warning)
- Confirmation
- Input
- File picker
- Color picker
- Date/Time picker

### Alert & Toast Notifications

**Toast** (temporary, bottom-right):
```
┌─────────────────────────────┐
│ ✓ File saved successfully   │
└─────────────────────────────┘
```

**Alert** (requires action):
```
┌──────────────────────────────┐
│ ⚠ Warning                 ✕ │
├──────────────────────────────┤
│ Are you sure?                │
├──────────────────────────────┤
│ [Cancel]          [Continue] │
└──────────────────────────────┘
```

---

## Window Management

### Window Chrome

**Title Bar**:
- Close button (red) - Left
- Minimize button (yellow) - Left
- Maximize button (green) - Left
- Title text (centered)
- Context menu button (right)

**Resizing**:
- Bottom-right corner drag
- Edge drag (8px margin)
- Double-click title to maximize
- Keyboard shortcuts (Cmd+Ctrl+F for fullscreen)

### Window Animations

- **Open**: Scale-in from center (0.3s)
- **Close**: Fade-out (0.2s)
- **Minimize**: Scale-down to dock (0.4s)
- **Maximize**: Smooth expansion (0.3s)
- **Resize**: Smooth dimension change (0.2s)

### Stage Manager

**Features**:
- Grouped window organization
- Gesture-based window switching
- Automatic window arrangement
- Grid snapping (½, ⅓ screen)
- Keyboard shortcuts (Cmd+Option+Right/Left)

### Multiple Desktops (Spaces)

**Features**:
- Up to 16 virtual desktops
- Application persistence across spaces
- Quick switching (Ctrl+Arrow Keys)
- Mission Control overview (F3)
- Swipe gestures (4-finger left/right)

---

## Animations & Motion

### Standard Durations
```
Quick:      0.2s  (instant feedback)
Normal:     0.3s  (standard transitions)
Slow:       0.5s  (dramatic effect)
Extra Slow: 1.0s  (tutorials/demos)
```

### Easing Functions
```
Linear:        constant speed
Ease-in:       start slow, accelerate
Ease-out:      start fast, decelerate
Ease-in-out:   slow, fast, slow (smooth)
Spring:        bounce effect
```

### Interactive Elements

**Hover Effects**:
- Slight scale increase (1.05x)
- Brightness adjustment
- Underline appearance
- Color shift

**Press Effects**:
- Scale down (0.95x)
- Brightness decrease
- Haptic feedback (if available)
- Brief highlight

---

## Login Screen

### Components

```
┌─────────────────────────────────────┐
│                                     │
│            AuroraOS 1.0             │
│                                     │
│    [Profile Picture]                │
│    [Username Display]               │
│                                     │
│    [Password Field]   👁️            │
│                                     │
│    [Unlock]  [Other Users]          │
│                                     │
│    Date & Time          Wake Siri   │
│                                     │
└─────────────────────────────────────┘
```

### Features

- Sierra-style background blur
- User profile picture
- Password field with show/hide
- Face recognition indicator
- Fingerprint ready indicator
- Time and date display
- Nova quick access

---

## Accessibility

### Color Contrast
- WCAG AA: 4.5:1 for text
- WCAG AAA: 7:1 for text (achieved for all critical elements)

### Motion
- Reduce motion option (no animations when enabled)
- High contrast mode
- Increased text size (up to 200%)

### Audio
- Visual indicators for system sounds
- Live captions for videos
- Sound descriptions
- Haptic feedback alternatives

### Input
- Full keyboard navigation
- Voice control
- Switch control
- Mouse tracking
- Eye tracking support

---

## Responsive Design

### Breakpoints

```
Mobile:        < 768px  (1024x768 minimum)
Tablet:        768px - 1366px
Desktop:       1366px - 2560px
Ultra-wide:    > 2560px
```

### Layout Modes

- **Mobile**: Single-column, touch-optimized
- **Tablet**: Two-column, medium touch targets
- **Desktop**: Multi-column, precise controls
- **Multi-monitor**: Optimized distribution

---

**AuroraOS 1.0 Design System - Elegant, Consistent, Accessible**