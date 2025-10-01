# Crop Care

Crop Care is a Flutter app that helps farmers and agronomists quickly validate crop health from a leaf photo, preview an AI diagnosis, and review past results. This repo currently contains a navigation-first prototype to validate screen flow.

## Features (Prototype)
- Home screen with entry point to the workflow
- Capture screen (placeholder for camera/gallery)
- AI Analysis screen (simulated step)
- Result screen (simulated diagnosis output)
- Recommendations screen (simulated advice)
- History screen (basic list placeholder)

## Navigation Workflow
Home → Capture → AI Analysis → Result → Recommendations → History → Home

There is also a splash screen that navigates to Home after a short delay.

## Tech Stack
- Flutter (Material 3 theme)
- Dart

## Getting Started
1) Prerequisites
   - Flutter SDK installed and configured
   - Android Studio and/or Xcode (for Android/iOS respectively)
   - Dart/Flutter extensions in your IDE (VS Code or Android Studio)

2) Install dependencies
```bash
flutter pub get
```

3) Run (choose a device/emulator first)
```bash
flutter run
```

4) Build release (optional)
```bash
flutter build apk   # Android
flutter build ios   # iOS (requires macOS & Xcode)
```

## Project Structure (high level)
```
lib/
  core/                  # theme, utils, constants, errors
  data/                  # placeholder data layer
  presentation/
    screens/             # all UI screens used in the prototype
    providers/           # state management placeholders
    widgets/             # reusable UI widgets
  main.dart              # app entry, routes
```

## Routes
Routes are registered in `lib/main.dart` and use named navigation:
- `/` (Splash)
- `/home`
- `/capture`
- `/analysis`
- `/result`
- `/recommendations`
- `/history`

## Notes
- This is a navigation test build; the AI and camera are mocked as simple buttons.
- Replace placeholders with real integrations when ready.

## License
MIT (see `LICENSE`)
