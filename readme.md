## Description
The ToDoList project features a clean task management application that allows users to seamlessly add new tasks, toggle completion states with visual strikethrough feedback, filter items through an integrated search bar, and delete tasks using swipe gestures.

## SwiftUI API Reference
### Layout
- **NavigationStack** : Enables stack-based navigation across views with a top navigation title and integrated search interface.
- **VStack()** : Stacks elements vertically (top to bottom).
- **HStack()** : Stacks elements horizontally (left to right).
- **Spacer()** : Flexible empty space that expands to push adjacent elements apart.
- **List** : Displays a scrollable collection of task rows with built-in swipe-to-delete support.

### Content
- **Text()** : Displays task titles and status descriptions.
- **TextField()** : Provides an input field for adding new tasks and searching existing ones.
- **Button()** : Triggers task addition and completion toggle actions when tapped.
- **Image()** : Displays SF Symbols graphics for checkmark indicators and add buttons.
- **ContentUnavailableView()** : Displays a fallback view when no tasks are available or match the current search query.
- **ForEach()** : Iterates through task items to generate dynamic list rows.

### Modifiers
- **.font()** : Sets typography sizes and hierarchy styles (such as .title3 or custom system font sizes).
- **.padding()** : Adds spacing around or inside elements.
- **.foregroundColor()** : Sets the color of text and icons based on completion state.
- **.background()** : Applies background colors behind input fields.
- **.cornerRadius()** : Rounds the corners of input field borders.
- **.strikethrough()** : Draws a line through completed task text.
- **.textFieldStyle()** : Configures the visual appearance of the input text field.
- **.buttonStyle()** : Configures the styling and interaction behaviors of list buttons.
- **.listStyle()** : Sets the visual presentation style of the list container.
- **.searchable()** : Integrates a native search bar directly into the navigation stack.
- **.disabled()** : Controls the interactive state of the add button when the input field is empty.
- **.onDelete()** : Enables swipe-to-delete action handling for list items.

## License
Copyright © 2026 Coding Bee Academy. All rights reserved.