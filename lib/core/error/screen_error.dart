import 'package:flutter/material.dart' show Material, Colors;
import 'package:flutter/widgets.dart';
import '../widgets/lottie_component/lottie_component.dart';

void errorScreen() {
  ErrorWidget.builder = (final details) => Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const LottieComponent(
                text: 'Something went wrong',
                lottiePath: '',
              ),
              const SizedBox(height: 8),
              Text(
                details.exception.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
}
