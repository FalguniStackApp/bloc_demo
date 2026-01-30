## BLoC Todo App with ViewModel

A Flutter application demonstrating BLoC State Management combined with the ViewModel pattern, following Clean Architecture principles.

### ✨ Features

- Add, Update, Delete Todo Tasks
- Persistent Local Storage (SharedPreferences)
- **BLoC State Management** (Global/Data State)
- **ViewModel Pattern** (UI Logic & Form Handling)
- Clean Architecture Structure
- **Dependency Injection** (GetIt)

### 🏗 Project Architecture

This project follows Clean Architecture with a Feature-Based Structure.

```
lib/
│
├── core/                       # Common utilities, constants, DI
│   └── di/                     # Dependency Injection (GetIt)
│
├── feature/
│   └── todo/
│       ├── data/               # Repositories & DataSources
│       ├── domain/             # Entities, Repositories, UseCases
│       └── presentation/
│           ├── bloc/           # BLoC (Events & States)
│           ├── view_models/    # ViewModels (UI Logic)
│           ├── pages/          # UI Views
│           └── widget/         # Reusable Widgets
│
├── shared/                     # Shared widgets and helpers
└── main.dart
```

### 🧠 Architecture Patterns

#### 1. BLoC (Business Logic Component)
- **Responsibility**: Manages the *Global Data State* (e.g., list of todos, loading status, error messages).
- **Files**: `todo_bloc.dart`, `todo_event.dart`, `todo_state.dart`.
- **Why**: Ensures predictably state management and separates business logic from UI.

#### 2. ViewModel
- **Responsibility**: Manages strictly *UI Logic* and *Form State* (e.g., `TextEditingController`, handling button taps, input validation).
- **Files**: `todo_view_model.dart`.
- **Interaction**: The ViewModel takes user input, validates it, and then adds events to the BLoC. It does *not* hold business data.

#### 3. View (Page)
- **Responsibility**: Renders the UI based on BLoC state.
- **Files**: `todo_page.dart`.
- **Interaction**: Uses `BlocBuilder` to listen to state changes and `TodoViewModel` to handle user actions.

### � Dependencies

- `flutter_bloc`: State management.
- `equatable`: Value equality for states/events.
- `get_it`: Service locator for Dependency Injection.
- `shared_preferences`: Local storage.

### 🚀 Getting Started

1.  `flutter pub get`
2.  `flutter run`