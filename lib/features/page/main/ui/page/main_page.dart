import 'dart:io';

import 'package:flutter/material.dart' show Scaffold, Drawer;
import 'package:flutter/widgets.dart'
    show StatelessWidget, BuildContext, Widget, Center, Text;
import '../../../../../core/widgets/app_bar_component/app_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
      appBar: HyDEAppBar(
        title:
            'Hello ${Platform.environment['USER']?.substring(0, 1).toUpperCase()}${Platform.environment['USER']?.substring(1) ?? ''}',
      ),
      drawer: const Drawer(),
      body: const Center(child: Text('Main Page')),
    );
}
