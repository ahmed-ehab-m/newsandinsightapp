# 📰 News & Insight App

A modern, fast, and scalable Flutter News Application that provides real-time top headlines and category-based news. The app features a seamless user experience with infinite scrolling (pagination), offline favorites caching, and an elegant UI handling all edge cases.

Built with **MVVM Architecture** principles and **Cubit (Bloc)** for robust state management.

## 🔥 Key Technical Highlights (Why this app stands out)
- **Advanced Pagination & Edge Cases:** Fully handled infinite scrolling edge cases. This includes preventing duplicate API calls during rapid scrolling, handling network drops seamlessly mid-scroll, and safely detecting the end of the data list.
- **Smart Data Caching & State Retention:** Optimized API usage and enhanced UX by preserving data state. If the user exits the app or navigates away and returns within a short timeframe (e.g., under a minute), the app instantly displays the cached data without making unnecessary and costly network requests.
- **Offline Favorites:** Saved articles are stored locally using **Hive** (NoSQL), allowing users to read their favorite news even without an internet connection.
- **Bulletproof UI States:** Beautiful Shimmer loading skeletons, custom empty states, and interactive network error screens with retry mechanisms.

## 📑 Table of Contents
- [Features](#-features)
- [Project Setup & API Configuration](#-project-setup--api-configuration)
- [Main Packages Used](#-main-packages-used)
- [Folder Structure (Clean Architecture)](#-folder-structure)

## ✨ Features
- **Real-time News:** Fetch top headlines and browse news by categories (Business, Sports, Tech, etc.).
- **Infinite Scrolling:** Implemented pagination to load more articles seamlessly as the user scrolls.
- **Local Favorites:** Save your favorite articles locally using Hive for offline access.
- **Smart UI States:** Beautiful Shimmer loading skeletons, empty states, and network error handling with retry mechanisms.
- **Bottom Navigation:** Smooth navigation retaining tab states using `GoRouter` (StatefulShellRoute).

## 🚀 Project Setup & API Configuration

This app uses an external News API. To run this project locally, you need to set up your API Key securely.

### 1️⃣ Get Your API Key
🔑 Visit [NewsAPI.org](https://newsapi.org/) (or your specific API provider) and register to get a free API Key.

### 2️⃣ Configure `.env` File
For security reasons, the API key is not committed to GitHub. You need to create a `.env` file in the root directory of the project.
1. Create a file named `.env` in the root folder.
2. Add your API Key inside it like this:
   ```env
   API_KEY=your_api_key_here
   BASE_URL=[https://newsapi.org/v2/](https://newsapi.org/v2/)
   
###3️⃣ Run the App
Run the following commands in your terminal:
Bash
flutter clean
flutter pub get
flutter run

### 📦 Main Packages Used
flutter_bloc: For implementing the Bloc/Cubit state management pattern.

get_it: For dependency injection and Service Locator.

go_router: For declarative routing and managing Bottom Navigation state.

dio: For handling HTTP requests and connecting to the API efficiently.

hive_flutter: For fast, local NoSQL database storage (Favorites feature).

cached_network_image: For efficiently loading and caching web images.

shimmer: For creating beautiful skeleton loading animations.

flutter_dotenv: For securely loading API keys from a .env file.

### 📂 Folder Structure
The app strictly follows Clean Architecture and Feature-Based MVVM concepts to ensure scalability and maintainability.

Plaintext
```
lib/
├── core/
│   ├── config/          # Environment variables and API endpoints
│   ├── errors/          # Failure models and Exception handling
│   ├── models/          # Shared models (e.g., NewsModel)
│   ├── services/        # ApiService, LocalStorageService
│   ├── theme/           # App colors, text styles, and themes
│   ├── utils/           # Constants, Strings, and Sizes
│   ├── di/              # Service Locator initialization
│   └── widgets/         # Shared UI components (Custom errors, Shimmers)
│
├── features/
│   ├── home/            # Top headlines, Categories, Pagination
│   ├── favorite/        # Local storage caching logic
│   ├── details/         # Article details screen
│
└── main.dart            # App entry point 
```
