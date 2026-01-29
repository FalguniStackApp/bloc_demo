## Bloc Demo

A Flutter application demonstrating BLoC State Management with Clean Architecture and Local Data Persistence using SharedPreferences.

This project is created to understand how to build a scalable Flutter app using proper folder structure and separation of concerns.

✨ Features

Add Todo Task

Update Todo Task

Delete Todo Task

Persistent Local Storage

BLoC State Management

Clean Architecture Structure

Dependency Injection with GetIt

🏗 Project Architecture

This project follows Clean Architecture with a Feature-Based Structure.

lib/
│
├── core/                     # Common utilities, constants, helpers
│
├── feature/
│   └── todo/
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       │
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       │
│       └── presentation/
│           ├── bloc/
│           ├── pages/
│           └── widgets/
│
├── injection_container.dart
└── main.dart

🧠 State Management

This app uses:

bloc

flutter_bloc

equatable

Why BLoC?

Predictable state flow

Clear separation between UI and logic

Easy testing

Scalable for large applications

📦 Dependencies
flutter_bloc:
bloc:
equatable:
get_it:
shared_preferences:

🔄 Data Flow
UI → Bloc → UseCase → Repository → DataSource → Local Storage


Presentation Layer → UI + Bloc

Domain Layer → Business Logic & Entities

Data Layer → Models, DataSources, Storage

💾 Local Storage

Todos are stored using SharedPreferences as JSON.

Example stored data:

[
{"id":1,"title":"Learn BLoC"},
{"id":2,"title":"Build Todo App"}
]

🚀 Getting Started
Prerequisites

Flutter SDK installed

Android Studio / VS Code

Emulator or Physical Device

Installation
flutter pub get
flutter run

📌 BLoC Events

LoadTodos

AddTodos

UpdateTodos

DeleteTodos

📌 BLoC States

Initial

Loading

Loaded

Error

🧩 Dependency Injection

Managed using GetIt.

Example:

sl.registerFactory(() => TodoBloc(sl()));
sl.registerLazySingleton(() => GetTodos(sl()));
sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(sl()));
sl.registerLazySingleton(() => TodoLocalDataSource());

📚 Learning Purpose

This project helps in understanding:

Clean Architecture in Flutter

BLoC Pattern

Local Data Persistence

Dependency Injection

Feature-based Folder Structure

Immutable State Handling