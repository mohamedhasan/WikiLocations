# WikiLocations

iOS app to fetch locations from server and show them on map, places can be used to redirect to wikipedia places iOS app.

# Usage:

1. Start the app.
2. Places will be loaded on start, tap any place to show redirection icon.
3. Tap on redirection icon to open Wikipedia app.
4. Make sure to install the forked version of the app on this branch:
https://github.com/mohamedhasan/wikipedia-ios/tree/add-location-deeplinking-support
5. User can add their own location by tapping on `Tap here to add a place on the map` button, and then tapping any coordinates on the map.
6. Tapping same button can disable adding custom location making it easier for the user to interact with the rest of the map.
7. To open Wikipedia app a deeplink is used with the following example: `wikipedia://location?latitude=55.6713442&longitude=12.553785&name=Copenhagen` latitude and longitude are mandatory, and name is optional one.

# Architecture:

1. Simple MVVM architecture using SwiftUI.
2. Dependency injection is used to insure decoupling, and testability.
3. Environment object is used for dependency injection, you can implement the `Environment` protocol and used different implementations.
4. Swift concurrency with async await is used for handling network calls, using a simple network layer.

# Future improvements & limitations:

1. Currently App is supporting only iOS 17, to be able to make use of the `MapReader` for Mapkit, this can be improved alternative ways can be found to support older iOS versions.
2. Also due to missing OOTB functionalities in SwifUI Mapkit, long tap wasn't easy to implement for adding a custom location by user, after some research I found some options, but had already made a decision to use the current way.
3. UI & Snapshots tests can be added.
   
# Testing:

1. Unit tests added to test all the logic.
2. UI testing template added, due to time limitation, UI tests wasn't implemented.
3. UI tests target is left to show real code coverage in case of testing SwiftUI modules (Currently is **86%**).


# Accessibility:

1. an Accessibility module is added, to make it easier to configure & inject accesibility properties into SwiftUI views.
2. Dark mode ✅.
3. Voice over ✅.
4. Large text size ✅.
5. Color contrast is failing in some areas, and it is a bit tricky with the map, better color options will fix this issues.
6. External input (Not needed).

# Non-functional additions:

1. Design system is used to separate design values.
2. Localizaion is used to support different languages, including right to left languages.
3. SwiftLint is used to enforce code style and conventions.
   
