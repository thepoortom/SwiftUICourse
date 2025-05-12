## Homework Assignment
Creating a Modular Application Using SOA/MVVM/Flux/MV

### Goal
- Improve an ability to choose the right architecture for an entire application.  
- Learn how to implement architectural patterns and understand the benefits of this approach.

### Description / Step-by-Step Instructions

1. **Choose an architecture** to implement a mini application:
   (e.g., VIPER, CleanSwift, MVP, Flux, etc.)

2. **Select an API**
   - You may use one from this list: [https://github.com/public-apis/public-apis](https://github.com/public-apis/public-apis)  
   - Or any other API that provides a list of entities.

3. **Implement onboarding:**
   - If the app is launched for the first time on a user’s device, show a few screens with a description of the app (text and content are up to you).  
   - If not, proceed directly to the tab screen.

4. **Create a screen with two tabs:**
   - First tab: a list of items.  
   - Second tab: a list of favorite items.

5. **List screen:**
   - Display brief information about the entities retrieved from the API.  
   - Each item should include an icon indicating if it's a favorite.  
   - Tapping the icon should add or remove the item from favorites.

6. **Pagination:**
   - If the API supports it, implement pagination as discussed in class.

7. **Data persistence:**
   - Store the list of favorites and the onboarding-completion flag.  
   - Use any method: `CoreData`, `UserDefaults`, `SwiftData`, etc.

8. **Implement Dependency Injection (DI):**
   - Use any method (library-based or custom).  
   - Inject dependencies using DI.

9. **Modularization:**
   - Move the data storage services and the networking layer into separate modules.  
   - Try to extract features into separate modules as well.
