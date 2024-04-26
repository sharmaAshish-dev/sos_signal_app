import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class SOSToggleButton extends StatefulWidget {
  final Function(bool) onToggle;

  const SOSToggleButton({super.key, required this.onToggle});

  @override
  State<SOSToggleButton> createState() => _SOSToggleButtonState();
}

class _SOSToggleButtonState extends State<SOSToggleButton> {
  final minDistance = -5.0;
  bool isActivate = false;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 240,
      height: 240,
      child: NeumorphicButton(
        pressed: isActivate,
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: const NeumorphicBoxShape.circle(),
          depth: isActivate ? minDistance : -minDistance,
          intensity: 1,
          lightSource: LightSource.topLeft,
          color: const Color(0xFFE0E0E0),
        ),
        onPressed: () {
          setState(() {
            isActivate = !isActivate;
            widget.onToggle(isActivate);
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.warning,
              size: 60,
              color: isActivate ? Colors.red : Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              'SOS',
              style: TextStyle(
                fontSize: 28,
                color: isActivate ? Colors.red : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
