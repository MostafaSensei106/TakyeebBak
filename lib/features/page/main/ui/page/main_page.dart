import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:takyeebbak/core/widgets/app_bar_component/app_bar.dart';
import 'package:takyeebbak/features/page/home/ui/page/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
    body: SafeArea(
      child: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomePage(),
          Center(child: Text('Store')),
          Center(child: Text('Wishlist')),
          Center(child: Text('Profile')),
        ],
      ),
    ),
    bottomNavigationBar: NavigationBar(
      height: 80,
      elevation: 0,
      selectedIndex: _selectedIndex,
      onDestinationSelected: _onDestinationSelected,
      destinations: const [
        NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
        NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
        NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
        NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
      ],
    ),
  );
}
