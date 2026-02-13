# Todo App

A simple Flutter todo application with local data persistence using Hive database.

## Features

- Add, complete, and delete tasks
- Persistent local storage with Hive
- Yellow-themed Material Design UI
- Cross-platform support (iOS, Android, Web, macOS, Linux, Windows)
- Swipe-to-delete functionality with flutter_slidable

## Tech Stack

- **Flutter** - Cross-platform framework
- **Hive** - Fast, lightweight NoSQL database for local storage
- **flutter_slidable** - Swipeable list items

## Getting Started

### Prerequisites

- Flutter SDK (3.11.0 or higher)
- Dart SDK
- iOS/Android development environment (for mobile builds)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/Tyler-dev-eng/todo.git
cd todo
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── data/
│   └── database.dart      # Hive database operations
├── pages/
│   └── home_page.dart     # Main todo list page
├── utils/
│   ├── dialogbox.dart     # Add task dialog
│   ├── my_buttons.dart    # Custom button widget
│   └── to_do_tile.dart    # Todo item widget
└── main.dart              # App entry point
```
