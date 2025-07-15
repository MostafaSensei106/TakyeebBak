import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(child: Column(children: const [


      ],
        )),
    ),
    bottomNavigationBar: NavigationBar(
      destinations: const [
        NavigationDestination(icon: Icon(CupertinoIcons.home), label: 'Home'),
        NavigationDestination(icon: Icon(CupertinoIcons.cart), label: 'Cart'),
        NavigationDestination(
          icon: Icon(CupertinoIcons.person),
          label: 'Profile',
        ),
      ],
    ),
  );
}
