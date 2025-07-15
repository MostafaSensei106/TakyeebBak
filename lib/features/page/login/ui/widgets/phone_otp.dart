import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:takyeebbak/core/config/constants/app_constants.dart';
import 'package:takyeebbak/core/widgets/app_bar_component/app_bar.dart';
import 'package:takyeebbak/core/widgets/button_components/elevated_button_components/elevated_button_component.dart';

class PhoneOtpPage extends StatefulWidget {
  const PhoneOtpPage({super.key});

  @override
  State<PhoneOtpPage> createState() => _PhoneOtpPageState();
}

class _PhoneOtpPageState extends State<PhoneOtpPage> {
  final int otpLength = 4;
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(otpLength, (_) => TextEditingController());
    focusNodes = List.generate(otpLength, (_) => FocusNode());
  }

  void _onOtpFieldChanged(String value, int index) {
    if (value.length > 1) {
      final paste = value.replaceAll(RegExp(r'[^0-9]'), '');
      for (int i = 0; i < otpLength; i++) {
        if (i < paste.length) {
          controllers[i].value = TextEditingValue(
            text: paste[i],
            selection: TextSelection.collapsed(offset: 1),
          );
        } else {
          controllers[i].clear();
        }
      }
      FocusScope.of(context).unfocus();
    } else {
      if (value.isNotEmpty && index < otpLength - 1) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      } else if (value.isEmpty && index > 0) {
        FocusScope.of(context).requestFocus(focusNodes[index - 1]);
      }
    }
  }

  Widget _buildOtpField(int index) {
    return SizedBox(
      width: 68,
      height: 64,
      child: TextFormField(
        controller: controllers[index],
        focusNode: focusNodes[index],
        style: Theme.of(context).textTheme.titleLarge,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) => _onOtpFieldChanged(value, index),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.outBorderRadius),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApAppBar(title: 'Phone Otp'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(otpLength, _buildOtpField),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButtonComponent(label: 'Next', onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
