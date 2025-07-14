import 'package:flutter/material.dart';
import 'package:takyeebbak/core/helpers/formating.dart';
import 'package:takyeebbak/core/routing/routes.dart' show Routes;
import 'package:takyeebbak/core/widgets/app_bar_component/app_bar.dart';
import 'package:takyeebbak/core/widgets/button_components/elevated_button_components/elevated_button_component.dart';
import 'package:takyeebbak/core/widgets/button_components/elevated_button_components/elevated_outline_button_component.dart';
import 'package:takyeebbak/core/widgets/text_form_field_components/text_form_field_component.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApAppBar(title: 'Login'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: () {},
              child: Column(
                spacing: 8,
                children: [
                  TextFormFieldComponent(
                    label: "Phone Number",
                    prefixText: "+966 | ",
                    controller: TextEditingController(),
                    keyboarInputType: TextInputType.number,
                    inputFormatters: [phoneFormatter],
                    validator: (_) {
                      final cleaned = phoneFormatter.getUnmaskedText();
                      if (!cleaned.startsWith('5')) {
                        return 'Phone number must start with 5';
                      }
                      if (cleaned.length != 9) {
                        return 'Phone number must consist of 9 digits after the prefix';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 150),
            SizedBox(
              width: double.infinity,
              child: ElevatedButtonComponent(label: 'Next', onPressed: () {}),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedOutlineButtonComponent(
                label: 'Create Account',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.registerPage);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
