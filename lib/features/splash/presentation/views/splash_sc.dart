
import 'package:flutter/material.dart';

class SplashSc extends StatefulWidget {
  const SplashSc({super.key});

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const SplashSc());

  @override
  State<SplashSc> createState() => _SplashScState();
}

class _SplashScState extends State<SplashSc> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Column(
            children: [],
          ),
        ),
      );
}
