# Habit Tracker - Your Daily Habit Companion

Habit Tracker is an intuitive and beautifully designed mobile application that helps you build and maintain positive habits effortlessly. Track your progress, visualize your streaks, and stay motivated on your journey to self-improvement.

## ✨ Features

* Effortless Habit Creation: Easily add new habits with custom recurrence patterns (daily, weekly on specific days, every X days).
* Intuitive Tracking: Mark habits as completed with a single tap.
* Calendar View: Visualize your habit completion status on a monthly calendar, seeing at a glance which days you succeeded, partially succeeded, or missed.
* Detailed Statistics:
    * Overall Completion Rate: See your habit success rate across all habits.
    * Last 7 & 30 Days Performance: Understand your recent consistency.
    * Current Streak: Stay motivated by watching your consecutive completion days grow!
* Edit & Delete: Full control over your habits with easy editing and deletion options.
* Data Persistence: Your habit data is safely stored locally on your device.

## 🛠️ Tech Stack

Habit Tracker is built using Flutter 3.32.5.

* Clean Architecture: Following clean archeticture and clean code to ensure the code is readable and maintanable.
* BLoC/Cubit: State management, ensuring a clear separation of concerns.
* Freezed: To generate immutable data classes and union types, enhancing type safety and reducing boilerplate.
* Injectable: A convenient code generator for GetIt, simplifying dependency injection and service location.
* Hive: A lightweight and lightning-fast key-value database, perfect for local data storage.
* TableCalendar: A highly customizable Flutter widget for displaying calendars, used for the habit completion overview.

## 📸 Screenshots


![Habit List](https://res.cloudinary.com/doq2p4sx1/image/upload/v1752856856/Group_48096401_ltakap.webp) 

## 🖌️ Material Theme Following

* Support Light and Dark theme.

### Resources

* Build theme and color scheme using ([Material Theme builder](https://material-foundation.github.io/material-theme-builder/))

### Demo Release
* Download the APK from the Drive ([APK HERE](https://drive.google.com/file/d/1w6fokBY8kLtDlxPdOvSKPy0m4jYHCm3U/view?usp=drive_link))

### Installation

    1.  Clone the repo:
    
    git clone https://github.com/Mhd-Az100/habit_tracker.git
    cd habitflow

    2.  Get dependencies:
    flutter pub get

    3.  Generate code (for Freezed and Injectable):
    flutter pub run build_runner build --delete-conflicting-outputs
    
    4.  Run the app:
    flutter run