import 'package:flutter/material.dart';
import 'package:sos_signal/widgets/sos_toggle_button.dart';
import 'package:torch_light/torch_light.dart';

// This class represents the main SOS signal widget
class SOSSignal extends StatefulWidget {
  const SOSSignal({super.key});

  @override
  State<SOSSignal> createState() => _SOSSignalState();
}

class _SOSSignalState extends State<SOSSignal> {
  // This string represents the Morse code for SOS
  final sosString = '111000111';

  // This duration represents the time to wait between light on/off cycles
  final stopDuration = const Duration(milliseconds: 300);

  // This boolean flag tracks if the SOS signal is currently active
  bool isActivate = false;

  // This function sends the SOS signal using the torch light
  sendSOS() async {
    isActivate = true;

    while (isActivate) {
      for (var i = 0; i < sosString.length; i++) {
        if (!isActivate) break;

        // Check if the current character in the SOS string is a '1' (light on)
        if (sosString[i] == '1') {
          TorchLight.enableTorch();
          await Future.delayed(stopDuration); // Wait for stop duration
          TorchLight.disableTorch();
          await Future.delayed(stopDuration); // Wait for stop duration
        } else {
          TorchLight.disableTorch();
          await Future.delayed(stopDuration); // Wait for stop duration (light off)
        }
      }

      await Future.delayed(stopDuration * 5); // Wait between SOS cycles
    }
  }

  // This function stops the SOS signal
  stopSOS() {
    isActivate = false;
    TorchLight.disableTorch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      body: Center(
        child: SOSToggleButton(
          // This callback function is called when the toggle button is pressed
          // It checks the button state and starts/stops the SOS signal accordingly
          onToggle: (isActivate) => isActivate ? sendSOS() : stopSOS(),
        ),
      ),
    );
  }
}
