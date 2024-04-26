import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_settings/quick_settings.dart';

import 'app.dart';

// This function is the entry point of the application
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Configure the status bar and navigation bar styles
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make the status bar transparent
      statusBarIconBrightness: Brightness.light, // Set light icons for status bar
      systemNavigationBarColor: Colors.transparent, // Make the navigation bar transparent
      systemNavigationBarIconBrightness: Brightness.light, // Set light icons for navigation bar
    ),
  );

  QuickSettings.setup(
    onTileClicked: onTileClicked,
    onTileAdded: onTileAdded,
    onTileRemoved: onTileRemoved,
  );

  // Run the main app widget
  runApp(const MyApp());
}
