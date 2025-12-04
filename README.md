# 📱 [Task Orangebayhurghada]

A generic description of the project goes here. Explain what the app does, the main problem it solves, and the primary features.

![Build](https://img.shields.io/badge/Build-AndroidStudio-blue) ![Flutter](https://img.shields.io/badge/Flutter-3.38.3-blue)

## 📸 Screenshots

| Home Screen | Similar Screen | Details Mode |
|:-----------:|:--------------:|:---------:|
| <img src="https://github.com/user-attachments/assets/e51bec20-6dc8-4923-aab7-334f990e5551" width="200"/> | <img src="https://github.com/user-attachments/assets/86a1a341-dc2d-451f-aec4-d8336820008a" width="200"/> | <img src="https://github.com/user-attachments/assets/cac8f44b-01a7-4ebc-a098-10696336f507" width="200"/> |

## ✨ Features

- List the key features of the application.
- Feature 1 (Home).
- Feature 2 (Product).
- Feature 3 (Banners).
- Feature 4 (Product Details).
- Feature 5 (Review).
- Feature 6 (Help).

## 🏗️ Architecture

This project adopts the **MVVM (Model-View-ViewModel)** architectural pattern, integrated with the **Repository Pattern**. This approach ensures a clear separation of concerns between the UI (View), the business logic (ViewModel), and the data handling (Model/Repository).

The architecture is structured as follows:

1.  **View (UI):**
    * Consists of Flutter Widgets.
    * Responsible for displaying data and capturing user events.
    * Observes the **ViewModel** for state changes (using `BlocBuilder` or `Consumer`).

2.  **ViewModel (State Management):**
    * Acts as the bridge between the View and the Repository.
    * Holds the UI state and processes user actions.
    * Does not know about the UI implementation (no `BuildContext`).
    * Communicates with the **Repository** to fetch or save data.

3.  **Repository Layer:**
    * **Repository Interface:** Defines the contract for data operations (abstract class).
    * **Repository Implementation:** The actual logic that decides whether to fetch data from a **Remote Data Source** (API).
    * This layer acts as the single source of truth for the app data.

4.  **Model:**
    * Represents the data structures (Data classes, JSON parsers).

### 🔗 References
* [Flutter Architecture Guide - MVVM](https://docs.flutter.dev/app-architecture/guide#mvvm)

## 🚀 How to Run

Follow these steps to get the project up and running on your local machine.

### Prerequisites
* Flutter SDK installed.
* Dart SDK installed.

### Installation

1.  **Clone the repository:**
    ```bash
    git clone [YOUR_REPO_LINK]
    ```

2.  **Navigate to the project directory:**
    ```bash
    cd [PROJECT_FOLDER_NAME]
    ```

3.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

4.  **Generate Code (Crucial Step):**
    Since this project uses code generation , run:
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

5.  **Run the App:**
    ```bash
    flutter run
    ```


