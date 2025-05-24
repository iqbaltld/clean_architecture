# 🧼 Flutter Clean Architecture Template

A scalable, modular, and easy-to-use clean architecture template for Flutter apps — built with best practices in mind. This project uses BLoC, get_it, injectable, dio, and more to help you kickstart your next production-grade app with confidence.

---

## 🚀 Getting Started

### 1. Create a New Project
```bash
flutter create --org com.example clean_architecture
cd clean_architecture
code .
```

---

## 📦 Add Dependencies

### Main dependencies
```bash
flutter pub add dio
flutter pub add equatable
flutter pub add flutter_bloc
flutter pub add get_it
flutter pub add injectable
flutter pub add shared_preferences
flutter pub add intl
flutter pub add dartz
```

### Dev dependencies
```bash
flutter pub add -d build_runner
flutter pub add -d injectable_generator
```

---

## 🛠️ File Structure & Setup

After creating the project and adding dependencies, modify or add the following files:

### 🔧 Core
- `lib/main.dart` – App entry point
- `lib/app.dart` – Root widget setup
- `lib/core/constants/api_endpoint.dart` – API URLs and endpoints
- `lib/core/constants/constants.dart` – Common constants (spacing, colors, etc.)
- `lib/core/injection/injection_container.dart` – Dependency injection setup
- `lib/core/navigation_service/navigation_service.dart` – Navigator key service
- `lib/core/network/api_client.dart` – Dio API client configuration
- `lib/core/network/custom_interceptor.dart` – Interceptor for headers and token handling
- `lib/core/router/app_router.dart` – Navigation setup

### 🧩 Feature Screens
- `lib/features/login/presentation/screens/login_screen.dart` – Redirect if token is expired
- `lib/features/home/presentation/screens/home_screen.dart` – Home UI

---

## 🔁 Code Generation

Run the following after editing injectable or models:
```bash
flutter clean && flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

---


## 📣 Author

**Muhammed Iqbal** – [LinkedIn](https://linkedin.com/in/iqbaltld)
