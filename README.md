# MAD AI - Your Personal AI Assistant

A versatile AI assistant application built with Flutter that integrates multiple AI functionalities including a ChatBot.This project was developed as part of a university assignment and showcases the use of modern app development techniques and the integration of powerful AI models.

## Features

*   **AI ChatBot:** Engage in intelligent and dynamic conversations.
*   **Light & Dark Mode:** Seamlessly switch between light and dark themes, with the user's preference saved locally.
*   **Smooth Animations:** Enjoy a fluid user experience with Lottie animations and animated widgets.
*   **Resilient API Logic:** The app intelligently cycles through multiple free AI models ensuring a high rate of success even if one model is unavailable.

## How It Works

The app is built with Flutter and leverages the GetX framework for state management and navigation.User preferences such as the selected theme are persisted locally using the `hive` database.

The core AI capabilities are powered by the **OpenRouter API**, which provides access to a variety of language models.The app is designed to be resilient,if a request to one AI model fails or times out,it automatically retries with the next available model in its list,ensuring a consistent user experience.

### Technical Stack

*   **Framework:** Flutter
*   **State Management:** GetX
*   **Local Storage:** Hive
*   **API Integration:** OpenRouter (for models-Mistral)
*   **HTTP Client:** `http` package
*   **UI & Animations:** `flutter_animate`, `lottie`, `google_fonts`

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

*   **Flutter SDK:** Make sure you have the Flutter SDK installed on your machine.You can find the installation guide [here](https://flutter.dev/docs/get-started/install).
*   **IDE:** An IDE like Android Studio or VS Code with the Flutter plugin.
*   **A Git client:** To clone the repository.

### Installation & Running the App

1.  **Open your Terminal/Command Prompt** and clone the repository to your local machine:
    
