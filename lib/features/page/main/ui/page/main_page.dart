
import 'package:flutter/material.dart' show Scaffold;
import 'package:flutter/widgets.dart'
    show StatelessWidget, BuildContext, Widget, Center, Text;

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
      body: const Center(child: Text('Main Page')),
    );
}
