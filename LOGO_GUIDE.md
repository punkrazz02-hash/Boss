# BlackVault Logo Implementation Guide

## 🎨 Logo Components

The BlackVault branding system includes three main logo variants:

### 1. **Circular Logo (BlackVaultLogo)**
- **Size**: 60-120px
- **Usage**: App bar, notifications, profile
- **Features**: 
  - Optional animations (scale, rotate, fade)
  - Gradient gold styling
  - Glow effect with shadow
  - "BV" monogram

```dart
BlackVaultLogo(
  size: 80,
  animated: true,
  animationDuration: Duration(milliseconds: 800),
)
```

### 2. **Shield Logo (BlackVaultShieldLogo)**
- **Size**: 120-400px
- **Usage**: Splash screen, dashboard background, marketing
- **Features**:
  - Premium shield design
  - Floating animation
  - Security lock icon
  - "VAULT" text

```dart
BlackVaultShieldLogo(
  size: 200,
  animated: true,
)
```

### 3. **Horizontal Logo (BlackVaultHorizontalLogo)**
- **Usage**: Drawer header, settings
- **Features**:
  - Company name + tagline
  - Flexible sizing
  - Custom text colors

```dart
BlackVaultHorizontalLogo(
  height: 40,
  textColor: Color(AppConstants.luxuryGold),
)
```

## 📱 Implementation in Screens

### Home Screen
- AppBar: Circular logo (40px)
- Background: Shield logo watermark (opacity: 0.08)
- Drawer: Horizontal logo

### Splash Screen
- Center: Animated circular logo (120px)
- Scale + Rotate + Fade animations

### Drawer Header
- Circular logo (60px) + Horizontal branding
- Professional gradient background

## 🎯 Color Specifications

- **Primary Gold**: #D4AF37
- **Accent Gold**: #FFA500
- **Shadow Color**: Gold with 0.3-0.5 opacity
- **Background**: #0F0F0F (Primary Black)

## ✨ Animation Details

**Logo Animations**:
- **Scale**: 0.8 → 1.0
- **Rotation**: -0.1 rad → 0.0 rad (elastic easing)
- **Opacity**: 0.0 → 1.0
- **Duration**: 800ms

**Shield Float Animation**:
- **Translation Y**: 0 → 10px
- **Duration**: 3 seconds
- **Curve**: easeInOut
- **Repeat**: infinite with reverse

## 🚀 Usage Examples

```dart
// In AppBar
appBar: AppBar(
  title: Row(
    children: [
      BlackVaultLogo(size: 40, animated: false),
      SizedBox(width: 16),
      Text('BlackVault'),
    ],
  ),
),

// As Background
Stack(
  children: [
    Positioned(
      top: -50,
      right: -100,
      child: Opacity(
        opacity: 0.08,
        child: BlackVaultShieldLogo(size: 400, animated: false),
      ),
    ),
    // Other content
  ],
)

// In Drawer
DrawerHeader(
  child: BlackVaultHorizontalLogo(),
)
```

## 📐 Responsive Sizing

- **Mobile**: 40-60px circles
- **Tablet**: 60-80px circles
- **Background watermark**: 300-400px
- **Dashboard**: 120-200px

---

**All logos are professionally designed with luxury styling, glassmorphism effects, and smooth animations.**
