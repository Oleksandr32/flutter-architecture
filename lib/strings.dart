class Strings {
  static const vanillaName = "Lifting State Up (Vanilla)";
  static const vanillaDescription =
      """ The vanilla example uses only the core Widgets and Classes that Flutter provides out of the box to manage state. The most important of these: the StatefulWidget.\n Share State by Lifting State Up - If two Widgets need access to the same state (aka data), \"lift\" the state up to a parent StatefulWidget that passes the state down to each child Widget that needs it.""";
  static const scopedModelName = "Scoped Model";
  static const scopedModelDescription =
      """ Scoped Model is a third-party package that is not included into Flutter framework.\n  A set of utilities that allow you to easily pass a data Model from a parent Widget down to its descendants. In addition, it also rebuilds all of the children that use the model when the model is updated. This library was originally extracted from the Fuchsia codebase.""";
  static const blocName = "BLoC";
  static const blocDescription =
      """ BLoC (Business Logic Components) is a pattern recommended by Google developers. It leverages streams functionality in order to manage and propagate state changes.\n  For Android developers: You can think of Bloc object as a ViewModel and of StreamController as a LiveData. This will make the following code very straightforward as you’re already familiar with the concepts.""";
  static const errorMessage =  "An error occured!!";
}
