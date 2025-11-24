# Crop Care

Crop Care is a Flutter prototype that helps farmers and agronomists validate crop health from a leaf photo, preview an AI diagnosis, and review results. This repository focuses on the capture → preview → analyze flow and provides a developer-friendly UI to integrate camera input and model inference.

## Progress (Current)
- **Navigation implemented:** Splash → Home → Capture → Preview → Analyze → Result → History.
- **Image preview & result screens:** Images now preserve aspect ratio, use a shared `Hero` transition, and support zoom & pan via `InteractiveViewer`.
- **Graceful image fallback:** `Image.asset` usages include `errorBuilder` placeholders to avoid runtime crashes when an asset cannot be loaded.
- **Assets included:** `assets/images/1.jpg`, `assets/images/2.jpeg`, `assets/images/8.png` and `pubspec.yaml` registers `assets/images/`.

## Features
- **Capture flow:** Button to open a preview screen (placeholder for camera/file picker integration).
- **Preview screen:** Zoomable/pannable image with Analyze action to navigate to the Result screen.
- **Result screen:** Shows the analyzed image, diagnosis summary, confidence meter, recommendations, and navigation actions.

## How to Run
- **Prerequisites:** Flutter SDK, an Android/iOS emulator or device.
- **Install dependencies:**
```powershell
flutter pub get
```
- **If you see asset load errors (common after adding assets):**
```powershell
flutter clean
flutter pub get
flutter run
```
- If assets still fail to appear, uninstall the app from the device/emulator and run `flutter run` again.

## Known Issues & Quick Fixes
- **Unable to load asset**: If an error like `Unable to load asset: assets/images/2.jpeg` appears at runtime, run the clean+pub get steps above — this usually resolves stale asset bundle issues.
- **Dynamic images (camera/files):** The prototype currently uses app assets. For live capture, change widgets to `Image.file(File(path))` and pass image file paths between screens.

## Next Steps
- Integrate camera or file-picker and pass live image paths to Preview and Result screens.
- Persist analysis results using a local database (e.g., Hive or sqflite) and improve the History screen.
- Replace simulated analysis with a real on-device model or backend inference service.

## Project Structure (high level)
```
lib/
  core/                  # theme, utils, constants, errors
  data/                  # data sources, repositories
  presentation/
    screens/             # UI screens (preview, result, capture, tabs)
    widgets/             # reusable UI widgets (capture button, image card)
  main.dart              # app entry and routing
```

## Contributing
- Open issues or PRs for UI improvements and camera/model integrations.

## License
MIT (see `LICENSE`)

## Screenshots
Below are medium-size screenshots of the app UI.

<p align="center">
  <img src="docs/screenshots/screenshot_1.png" alt="Home" width="480" />
  <br/>
  <em>Home</em>
</p>

<p align="center">
  <img src="docs/screenshots/screenshot_2.png" alt="Capture" width="480" />
  <br/>
  <em>Capture / Upload</em>
</p>

<p align="center">
  <img src="docs/screenshots/screenshot_3.png" alt="Result" width="480" />
  <br/>
  <em>Result</em>
</p>

<p align="center">
  <img src="docs/screenshots/screenshot_4.png" alt="Welcome" width="480" />
  <br/>
  <em>Welcome / Dashboard</em>
</p>

<p align="center">
  <img src="docs/screenshots/screenshot_5.png" alt="History" width="480" />
  <br/>
  <em>History</em>
</p>

<p align="center">
  <img src="docs/screenshots/screenshot_6.png" alt="Settings" width="480" />
  <br/>
  <em>Settings</em>
</p>

If you want me to add the actual image files into the repository (under `docs/screenshots/`), I can add them for you — confirm and I'll create the files from the attachments.

## Changelog (selected)
- 2025-10-30: Added aspect-preserving image rendering, Hero shared transition, and `InteractiveViewer` zoom/pan for image preview and result screens. Added `errorBuilder` fallbacks for asset rendering.
- 2025-11-24: README expanded with developer notes, run instructions, and guidance for switching to dynamic (captured) images.

## Developer Notes
- Files/areas touched recently:
  - `lib/presentation/screens/image_preview_screen.dart` — preview UI, `Hero` tag `preview-image`, wrapped image with `InteractiveViewer` and `errorBuilder`.
  - `lib/presentation/screens/result_screen.dart` — result image card uses `Hero` and `BoxFit.cover`, added `errorBuilder`.
  - `lib/presentation/widgets/capture_image.dart` — entrypoint button navigates to the preview screen.

- Using dynamic (captured) images:
  - Current prototype uses `Image.asset`. To show camera/file images, change constructors to accept a String `path` and use `Image.file(File(path))`.
  - Example constructor pattern for `ImagePreviewScreen`:

```dart
class ImagePreviewScreen extends StatelessWidget {
  final String imagePath;
  const ImagePreviewScreen({super.key, required this.imagePath});
  // ... use Image.file(File(imagePath)) instead of Image.asset
}
```

- Important: ensure you `import 'dart:io';` for `File` when using `Image.file`.

## Branch & Build Notes
- Current working branch: `feature` (verify with `git status` / `git branch`).
- If you modify `pubspec.yaml` assets or add image files, run:
```powershell
flutter clean
flutter pub get
flutter run
```
This is required to re-bundle assets into the app.

## Running Tests / Static Checks
- This repo includes basic widget tests. Run analyzer and tests with:
```powershell
flutter analyze
flutter test
```

## Contact / Owner
- Repository owner: `Joseph78888` (see repo metadata). Open issues or PRs in this repository for questions or contributions.
