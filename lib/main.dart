import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';

// This function is the entry point of the application
void main() {
  // Configure the status bar and navigation bar styles
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make the status bar transparent
      statusBarIconBrightness: Brightness.light, // Set light icons for status bar
      systemNavigationBarColor: Colors.transparent, // Make the navigation bar transparent
      systemNavigationBarIconBrightness: Brightness.light, // Set light icons for navigation bar
    ),
  );

  // Run the main app widget
  runApp(const MyApp());
}
