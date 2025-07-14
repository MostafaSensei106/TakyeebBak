import 'package:flutter/material.dart';
import 'package:takyeebbak/core/routing/routes.dart' show Routes;
import 'package:takyeebbak/core/widgets/app_bar_component/app_bar.dart';
import 'package:takyeebbak/core/widgets/button_components/elevated_button_components/elevated_button_component.dart';
import 'package:takyeebbak/core/widgets/button_components/elevated_button_components/elevated_outline_button_component.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApAppBar(title: 'Login'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Let\'s create your account'),

              TextField(),
              TextField(),
              TextField(),
              TextField(),
              TextField(),
              TextField(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButtonComponent(
                  label: 'Register',
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.mainPage);
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedOutlineButtonComponent(
                  label: 'I have an account',
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginPage);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
