import 'package:torch_light/torch_light.dart';

class SOSManager {
  static SOSManager? _instance;

  static SOSManager get instance => _instance ??= SOSManager();

  bool _isActive = false;

  void startSOS() => configSOS();

  Future<bool> isTorchAvailable() async {
    return TorchLight.isTorchAvailable();
  }

  // This function sends the SOS signal using the torch light
  configSOS({bool start = true}) async {
    _isActive = start;
    // This string represents the Morse code for SOS
    const sosString = '111000111';

    // This duration represents the time to wait between light on/off cycles
    const stopDuration = Duration(milliseconds: 300);

    while (_isActive) {
      for (var i = 0; i < sosString.length; i++) {
        if (!_isActive) break;

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
}
