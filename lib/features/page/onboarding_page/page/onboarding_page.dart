import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:takyeebbak/core/routing/routes.dart';
import 'package:takyeebbak/core/widgets/button_components/elevated_button_components/elevated_button_icon_component.dart';
import 'package:takyeebbak/core/widgets/button_components/icon_button_components/icon_button_component.dart';
import 'package:takyeebbak/core/widgets/button_components/icon_button_components/icon_button_filledtonal_component.dart';
import 'package:takyeebbak/core/widgets/lottie_component/lottie_component.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _checkAgreement();
  }

  Future<void> _checkAgreement() async {
    final prefs = await SharedPreferences.getInstance();
    final agreed = prefs.getBool('agreed_to_terms') ?? false;
    if (agreed) {
      _navigateToHome();
    } else {
      setState(() => _loading = false);
    }
  }

  void _navigateToHome() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.onboardingPage,
      (final route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _navigateToHome,
                    child: const Text('Skip'),
                  ),
                ],
              ),
              // PageView(
              //   controller: _pageController,
              //   children: const [
              //     LottieComponent(lottiePath: 'assets/lottie/1.json', text: 'Welcome to Takyeebbak!')
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 4,
                    effect: ExpandingDotsEffect(
                      // dotWidth: AppC.indicatorDotSize,
                      // dotHeight: SenseiConst.indicatorDotSize,
                      dotColor: Theme.of(
                        context,
                      ).colorScheme.onSurface.withAlpha((0.5 * 255).toInt()),
                      activeDotColor: Theme.of(
                        context,
                      ).colorScheme.primaryContainer,
                      expansionFactor: 2,
                    ),
                    onDotClicked: (final index) {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  IconButtonFilledTonalComponent(
                    icon: Icons.arrow_forward_ios_sharp,
                    onPressed: _navigateToHome,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
