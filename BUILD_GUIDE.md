# BlackVault - Comprehensive Build Guide

## 📋 Table of Contents
- [Project Setup](#project-setup)
- [Dependencies](#dependencies)
- [Firebase Configuration](#firebase-configuration)
- [Running the App](#running-the-app)
- [Building Releases](#building-releases)

## 🚀 Project Setup

### Prerequisites
```bash
# Install Flutter (3.x or higher)
# Install Dart (3.x or higher)
# Install Android Studio or Xcode
```

### Clone & Setup
```bash
git clone https://github.com/punkrazz02-hash/Boss.git
cd Boss

# Get dependencies
flutter pub get

# Generate build files
flutter pub run build_runner build
```

## 🔥 Firebase Configuration

### Step 1: Create Firebase Project
1. Go to [Firebase Console](https://console.firebase.google.com)
2. Create a new project
3. Add Android app:
   - Package name: `com.blackvault.app`
   - Download `google-services.json`
   - Place in `android/app/`

4. Add iOS app:
   - Bundle ID: `com.blackvault.app`
   - Download `GoogleService-Info.plist`
   - Place in `ios/Runner/`

### Step 2: Update firebase_options.dart
```dart
// Replace with your Firebase credentials
static const FirebaseOptions android = FirebaseOptions(
  apiKey: 'YOUR_ANDROID_API_KEY',
  appId: 'YOUR_ANDROID_APP_ID',
  messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
  projectId: 'YOUR_PROJECT_ID',
  storageBucket: 'YOUR_STORAGE_BUCKET',
);
```

## 📱 Running the App

### Android
```bash
# Debug
flutter run -d android

# Profile
flutter run -d android --profile

# Release
flutter run -d android --release
```

### iOS
```bash
# Debug
flutter run -d ios

# Release
flutter run -d ios --release
```

## 📦 Building Releases

### Android APK
```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

### Android App Bundle
```bash
flutter build appbundle --release
# Output: build/app/outputs/bundle/release/app-release.aab
```

### iOS
```bash
flutter build ios --release
```

## ✅ Next Steps
- [ ] Implement Firebase Firestore database schema
- [ ] Set up Firebase Authentication
- [ ] Configure Cloud Storage for receipts/documents
- [ ] Implement notification system
- [ ] Add analytics tracking
- [ ] Set up crash reporting

---

**For more details, refer to [Flutter Documentation](https://flutter.dev/docs)**
