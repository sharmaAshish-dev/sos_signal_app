import 'package:flutter/material.dart';
import 'package:sos_signal/screens/sos_signal.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOS Signal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent)
      ),
      debugShowCheckedModeBanner: false,
      home: const SOSSignal(),
    );
  }
}
