# Club_Connect
https://github.com/AnushkaJainCoder/Club_Connect/assets/144479723/360bebc0-72c4-48ec-ad81-bcd20f9219d8



Uploading imates_YSC8e6Qa (1).mp4…


# Club Connect

## Overview
**Club Connect** is a comprehensive iOS app that enhances club and event management. The app provides seamless engagement for club admins, enables easy discovery of clubs and events, features a comprehensive monthly calendar, and allows users to share their experiences socially.

The app is developed using **Swift** and **Firebase**, focusing on real-time data synchronization, user-centric design, and ease of use for both administrators and users.

## Features
- **Admin Functionality:**  
  Club admins can manage their clubs, create and promote events, and engage with members efficiently.
  
- **Club & Event Discovery:**  
  Users can effortlessly discover clubs and upcoming events that match their interests.
  
- **Comprehensive Calendar:**  
  A monthly calendar feature allows users to view and plan their club-related activities.

- **Social Sharing:**  
  Users can share their club experiences, events, and updates on social media platforms.

- **Real-time Data Sync:**  
  Firebase integration ensures real-time updates for clubs, events, and user interactions.

## Tech Stack
- **Frontend:** Swift (UIKit/SwiftUI)
- **Backend:** Firebase (Firestore for real-time data, Firebase Auth for user authentication, Firebase Storage for media management)
- **Tools:** Xcode, Firebase Console
- **Platform:** iOS

## Installation

### Prerequisites
- Xcode 12.0+
- Cocoapods (For Firebase dependencies)
- iOS device or simulator running iOS 14.0+

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/club-connect.git
   ```

2. Navigate to the project directory:
   ```bash
   cd club-connect
   ```

3. Install the dependencies:
   ```bash
   pod install
   ```

4. Open the project in Xcode:
   ```bash
   open ClubConnect.xcworkspace
   ```

5. Configure Firebase:
   - Add your Firebase `GoogleService-Info.plist` file to the root of the Xcode project.
   - Ensure Firebase services (Authentication, Firestore, Storage) are set up correctly in the Firebase Console.

6. Run the project:
   Select your target device or simulator and hit the `Run` button in Xcode.

## Screenshots
| Home Screen | Club Discovery | Event Management |
| ----------- | -------------- | ---------------- |
| ![Home Screen](screenshots/home.png) | ![Club Discovery](screenshots/discovery.png) | ![Event Management](screenshots/event.png) |

## Folder Structure

```
ClubConnect/
│
├── Controllers/         # View Controllers for different screens
├── Models/              # Data models for Club, Event, User
├── Views/               # Custom UI components
├── Services/            # Firebase services for Authentication, Database, Storage
├── Assets/              # App resources (icons, images)
├── Utils/               # Utility functions and extensions
└── Resources/           # Storyboards, .xib files, etc.
```

## Firebase Configuration
- **Authentication:** Used for user sign-up and login.
- **Firestore Database:** Used for storing club and event details.
- **Storage:** Used for managing media files (e.g., club banners, event flyers).

## Contributing
We welcome contributions to **Club Connect**. Here's how you can contribute:
1. Fork the repository.
2. Create a new branch (`git checkout -b feature-xyz`).
3. Commit your changes (`git commit -m 'Add feature xyz'`).
4. Push to the branch (`git push origin feature-xyz`).
5. Create a pull request.
