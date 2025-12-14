# Crop Care

Crop Care is a Flutter application empowering farmers and agronomists to instantly diagnose crop health using AI. By capturing or uploading a leaf photo, users receive immediate diagnosis, confidence metrics, and actionable recommendations.

## Key Features
- **AI-Powered Analysis**: Powered by Google's Gemini models for accurate plant disease diagnosis.
- **Smart History**: Automatically saves analysis results; includes filtering to exclude "Unknown Conditions".
- **Interactive Preview**: Zoom and pan capabilities for detailed image inspection.
- **Robust Architecture**: Built with Flutter Riverpod for state management and Sentry for error tracking.
- **Offline First**: Optimized to handle offline scenarios gracefully (banner notifications, cached history).

## 🛠️ Tech Stack
- **Framework**: Flutter (Dart)
- **State Management**: [Riverpod](https://riverpod.dev/)
- **ML diagnosis model** [TensorFlow Lite](https://www.tensorflow.org/lite)
- **AI Service**: [Google Gemini](https://ai.google.dev/) via `google_generative_ai`
- **Error Tracking**: [Sentry](https://sentry.io/)
- **Environment Management**: `flutter_dotenv`

## 📸 Screens

| Settings | Capture Tips | Analysis Result | History | Home |
|:---:|:---:|:---:|:---:|:---:|
| <img src="https://github.com/user-attachments/assets/c107eb85-f5d6-4df0-897f-47fc648f02f4" width="200"/> | <img src="https://github.com/user-attachments/assets/5604b8fa-e454-4da5-983b-0685fcdfae4c" width="200"/> | <img src="https://github.com/user-attachments/assets/0fac85a0-52d1-49c1-98ed-c0daaa386635" width="200"/> | <img src="https://github.com/user-attachments/assets/a1280f84-ac9f-459f-b93f-2fe2ebf045dd" width="200"/> | <img src="https://github.com/user-attachments/assets/0e1871bb-2a03-462f-a33d-1028c556ffc2" width="200"/> |

## ⚙️ Setup & Installation

### Prerequisites
- Flutter SDK (latest stable)
- Android Studio / Xcode
- A Google Gemini API Key
- A Sentry DSN (optional, for error reporting)

### 1. Clone & Install Dependencies
```bash
git clone https://github.com/Joseph78888/Crop-Care-App.git
cd Crop-Care-App
flutter pub get
```

### 2. Configure Environment Variables
Create a `.env` file in the root directory:
```bash
touch .env
```
Add your API keys to the `.env` file:
```properties
GEMINI_API_KEY=your_gemini_api_key_here
SENTRY_DSN=your_sentry_dsn_here
```
> [!IMPORTANT]
> The `.env` file is git-ignored. You must create it manually or the app will fail to start/analyze.

### 3. Run the App
```bash
flutter run
```

## Project Structure
```
lib/
├── core/               # App-wide constants, theme, utils
├── data/               # Repositories, API services (Gemini), datasources
├── presentation/       # UI Layer
│   ├── providers/      # Riverpod providers
│   ├── screens/        # Full-page widgets
│   └── widgets/        # Reusable components
└── main.dart           # Entry point
```

## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any bugs or improvements.

## 📄 License
MIT
