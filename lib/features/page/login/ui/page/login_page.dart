import 'package:flutter/material.dart';
import 'package:takyeebbak/core/widgets/app_bar_component/app_bar.dart';
import 'package:takyeebbak/core/widgets/button_components/elevated_button_components/elevated_button_component.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: ApAppBar(title: 'Login'),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('Welcome Back To TakyeebBak! lets Descover The World!'),
          TextField(),
          TextField(),
          ElevatedButtonComponent(label: 'Login', onPressed: (){}),
          ElevatedButtonComponent(label: 'Register', onPressed: (){}, isEnabled: false,)
        ],
      ),
    ),);
  }
}