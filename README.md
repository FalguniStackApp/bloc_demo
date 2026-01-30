## GetX Todo App

A Flutter application demonstrating GetX State Management with MVVM Architecture, Clean Architecture, and Local Data Persistence.

### ✨ Features

- Add, Update, Delete Todo Tasks
- Persistent Local Storage (SharedPreferences)
- **GetX State Management** (Reactive)
- **MVVM Architecture** (Model-View-ViewModel)
- Clean Architecture Structure
- **Centralized Dependency Injection** (GetX Bindings)
- **Centralized Routing**

### 🏗 Project Architecture

This project follows Clean Architecture with a Feature-Based Structure and MVVM.

```
lib/
│
├── app/                        # App-wide configurations
│   ├── bindings/               # Global Bindings (InitialBinding)
│   ├── routes/                 # Centralized Routing
│   └── app.dart                # App Entry Point
│
├── core/                       # Common utilities, constants
│
├── feature/
│   └── todo/
│       ├── data/               # Repositories & DataSources
│       ├── domain/             # Entities & UseCases
│       └── presentation/
│           ├── binding/        # Feature-specific Bindings
│           ├── controller/     # Data Controller (State)
│           ├── view_model/     # UI Logic & Interaction
│           ├── pages/          # UI View
│           └── widgets/
│
└── main.dart
```

### 🧠 State Management & MVVM

- **TodoController**: Acts as the *Source of Truth* for data. Manages `todoList` and `status`. It is pure data logic.
- **TodoViewModel**: Handles *UI Logic* (Text Editing, Form Validation, button clicks). It bridges the View and the Data Controller.
- **TodoPage**: The View. Listens to Controller state changes using `Obx`.

### 🧩 Dependency Injection (Bindings)

We use GetX's powerful dependency injection system, organized into two types of bindings to prevent data duplication and ensure optimal performance:

1.  **InitialBinding (`lib/app/bindings/initial_binding.dart`)**
    - **Purpose**: Initializes *Global* dependencies that the app needs throughout its lifecycle (e.g., Repositories, Database Services, API Clients).
    - **Usage**: Attached to `GetMaterialApp(initialBinding: ...)`
    - **Why**: Ensures core services are always available.

2.  **Feature Bindings (e.g., `TodoBinding` in `lib/feature/todo/presentation/binding/`)**
    - **Purpose**: Initializes *Feature-Specific* dependencies (Controllers, ViewModels).
    - **Usage**: Attached to routes in `RouteHelper`.
    - **Why**: Implementing **Lazy Loading**. Controllers are created only when the screen is opened and *destroyed* when closed, creating an efficient, memory-optimized app.

### 📦 Dependencies

- `get`: State management, navigation, dependency injection.
- `shared_preferences`: Local storage.

### 🚀 Getting Started

1.  `flutter pub get`
2.  `flutter run`