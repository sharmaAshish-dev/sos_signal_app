import 'package:flutter/material.dart';
import 'package:quick_settings/quick_settings.dart';
import 'package:sos_signal/screens/sos_signal.dart';

import 'sos_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOS Signal',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent)),
      debugShowCheckedModeBanner: false,
      home: const SOSSignal(),
    );
  }
}

@pragma("vm:entry-point")
Tile onTileClicked(Tile tile) {
  final oldStatus = tile.tileStatus;
  if (oldStatus == TileStatus.active) {
    // Tile has been clicked while it was active
    // Set it to inactive and change its values accordingly
    // Here: Disable the sos signal
    tile.label = "SOS Signal";
    tile.tileStatus = TileStatus.inactive;
    tile.subtitle = "On";
    tile.drawableName = "sos_on";
  } else {
    // Tile has been clicked while it was inactive
    // Set it to active and change its values accordingly
    // Here: Enable the sos signal
    tile.label = "SOS Signal";
    tile.tileStatus = TileStatus.active;
    tile.subtitle = "Off";
    tile.drawableName = "sos";
  }

  SOSManager.instance.configSOS(start: tile.tileStatus == TileStatus.active);

  // Return the updated tile, or null if you don't want to update the tile
  return tile;
}

@pragma("vm:entry-point")
Tile onTileAdded(Tile tile) {
  tile.label = "SOS Signal";
  tile.tileStatus = TileStatus.inactive;
  tile.subtitle = "On";
  tile.drawableName = "sos";
  return tile;
}

@pragma("vm:entry-point")
void onTileRemoved() {
  SOSManager.instance.configSOS(start: false);
}
