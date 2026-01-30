## Riverpod Todo App with ViewModel

A Flutter application demonstrating **Riverpod 2.0 (NotifierProvider)** State Management combined with the ViewModel pattern, following Clean Architecture.

### ✨ Features

- Add, Update, Delete Todo Tasks
- Persistent Local Storage (SharedPreferences)
- **Riverpod State Management** (NotifierProvider)
- **ViewModel Pattern** (UI Logic & Form Handling)
- Clean Architecture
- **Dependency Injection** (Riverpod Providers)

### 🏗 Project Architecture

This project follows Clean Architecture with a Feature-Based Structure.

```
lib/
│
├── core/
│   ├── constant/               # App Constants
│   └── di/
│       └── providers.dart      # Global Dependency Injection (Repositories, DataSources)
│
├── feature/
│   └── todo/
│       ├── data/               # Repositories & DataSources
│       ├── domain/             # Entities, Repositories, UseCases
│       └── presentation/
│           ├── providers/      # State Management (Notifier & State)
│           ├── view_models/    # ViewModels (UI Logic)
│           ├── pages/          # UI Views
│           └── widget/         # Reusable Widgets
│
├── shared/                     # Shared widgets and helpers
└── main.dart                   # ProviderScope & App Entry
```

### 🧠 Architecture Patterns

#### 1. Riverpod (State Management)
- **Providers**: Defined in `core/di/providers.dart` (DI) and `feature/.../providers/todo_provider.dart` (State).
- **TodoNotifier**: Extends `Notifier<TodoState>`. Manages the *Global Data State*.
- **State**: Immutable `TodoState`.

#### 2. ViewModel
- **Responsibility**: Manages strictly *UI Logic* (TextEditingController) and bridges UI events to the Provider.
- **Files**: `todo_view_model.dart`.
- **Interaction**: Accepts `WidgetRef` in methods to interact with `ref.read(todoProvider.notifier)`.

#### 3. View (ConsumerWidget)
- **Responsibility**: Renders the UI and listens to state changes.
- **Files**: `todo_page.dart`.
- **Interaction**: Extends `ConsumerStatefulWidget` to access `ref.watch(todoProvider)`.

### 📦 Dependencies

- `flutter_riverpod`: State management & DI.
- `equatable`: Value equality.
- `shared_preferences`: Local storage.

### 🚀 Getting Started

1.  `flutter pub get`
2.  `flutter run`