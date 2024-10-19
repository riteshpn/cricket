# cricket


Flutter MVVM Example App
Overview
This project is a simple Flutter application developed for learning purposes, focusing on the MVVM (Model-View-ViewModel) architecture. It aims to demonstrate the separation of UI and business logic.

Key Features
MVVM Architecture: This app follows the MVVM pattern, ensuring a clear separation between UI and business logic.
Static UI: The user interface is static, allowing the data to be managed separately in the business logic.
Enum Usage: Implemented enums for better state management and clarity in the code.

Project Structure
Model: Contains data structures and business logic.
View: The UI components that display data without directly containing any business logic.
ViewModel: Acts as a bridge between the Model and View, managing the data and logic needed for the UI.

API Integration
The app interacts with a REST API. Please find the API URL and key in the lib/constants.dart file.
Screens
The application consists of three main screens, showcasing how UI is separated from data logic:

Home Screen: Displays a summary of the app's features.
ListTeamScreen:Show only Teams 
Details Screen: Shows detailed information retrieved from the API.
ListPlayerScreen: Allows users to adjust app settings.

Advantages of MVVM
Separation of Concerns: Clear distinction between UI and business logic, making the codebase easier to manage and test.
Reusability: ViewModels can be reused across different views.
Testability: Business logic can be tested independently from the UI, enhancing the overall reliability of the application.
Conclusion
This project has been an amazing experience, allowing me to explore the benefits of the MVVM architecture in Flutter. Feel free to explore the code and implement your features!