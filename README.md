# NearbyApp

**NearbyApp** is a native iOS application, developed in **Swift** and **UIKit**, aiming to connect users with nearby establishments, offering coupons and detailed information. The app features a modern and responsive design, providing an intuitive user experience.

---

## Features

- **Splash Screen**  
  A vibrant initial screen to introduce the application.

- **Welcome Screen**  
  Guides the user through the app's main functionalities, with visual tips and clear descriptions.

- **Place Listing and Filtering**
  - Displays a list of nearby establishments.
  - Allows filtering locations by different categories *(Food, Shopping, Lodging, Bakery, Cinema, etc.)*.
  - Integration with **MKMapView** for visualizing locations on a map, with custom pins.

- **Place Details**
  - Establishment cover image.
  - Name and description.
  - Number of available coupons.
  - Address and phone number.
  - Coupon usage regulations.
  - Coupon code.

- **Navigation and User Flow**
  - Utilizes a `NearbyFlowController` to manage the navigation flow *(Splash → Welcome → Home)*.
  - Smooth navigation between the list of places and the details screen.

- **Reusable Components**
  - Custom UI components such as `TipsView` and `PlaceTableViewCell` to ensure consistency and ease of maintenance.

- **API Integration**
  - Consumes data from a local API (`http://127.0.0.1:3333`) to fetch category and place information.

- **Basic Design System**
  - Constants for colors (`Colors.swift`), images (`Images.swift`), and typography (`Typography.swift`) to ensure consistent and maintainable design.

---

## Technologies Used

- **Swift** – Primary programming language for iOS development.  
- **UIKit** – Framework for building native user interfaces.  
- **MapKit** – For displaying and interacting with maps and location annotations.  
- **CoreLocation** – For managing user location services.  
- **URLSession** – For network requests and API consumption.  
- **MVVM** – Used in the `HomeView` to separate business logic from the UI.  
- **Git** – For version control.

---

## Project Structure

NearbyApp/
│
├── AppDelegate.swift             # Manages the application lifecycle
├── SceneDelegate.swift           # Configures the main window and flow
│
├── Resources/
│   └── Assets.xcassets           # Image and color assets
│
├── Source/
│   ├── Constants/
│   │   ├── Colors.swift          # Custom color definitions
│   │   ├── Images.swift          # Enum for referencing image names
│   │   └── Typography.swift      # Font and text style definitions
│   │
│   ├── Features/
│   │   ├── Components/           # Reusable UI components (e.g., TipsView)
│   │   ├── Coordinator/          # Manages navigation flow
│   │   ├── Extension/            # Useful class extensions
│   │   ├── Models/               # Data structures (e.g., Category, Place)
│   │   └── Scenes/
│   │       ├── Details/          # Place details screen
│   │       ├── HomeView/         # Map, filters, and places list
│   │       ├── Splash/           # Splash screen
│   │       └── WelcomeView/      # Onboarding screen

