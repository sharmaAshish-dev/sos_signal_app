import 'package:flutter/material.dart';
import 'package:quick_settings/quick_settings.dart';
import 'package:sos_signal/sos_manager.dart';
import 'package:sos_signal/widgets/sos_toggle_button.dart';

// This class represents the main SOS signal widget
class SOSSignal extends StatefulWidget {
  const SOSSignal({super.key});

  @override
  State<SOSSignal> createState() => _SOSSignalState();
}

class _SOSSignalState extends State<SOSSignal> {
  bool torchAvailable = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Check if the torch light is available on the device
      SOSManager.instance.isTorchAvailable().then((isAvailable) {
        if (!isAvailable) {
          // If the torch light is not available, show an error message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Torch light is not available on this device"),
            ),
          );
        } else {
          setState(() {
            torchAvailable = isAvailable;
          });

          QuickSettings.addTileToQuickSettings(
            label: "SOS Signal",
            drawableName: "alarm",
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      body: Center(
        child: torchAvailable
            ? SOSToggleButton(
                // This callback function is called when the toggle button is pressed
                // It checks the button state and starts/stops the SOS signal accordingly
                onToggle: (isActivate) => SOSManager.instance.configSOS(start: isActivate),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
