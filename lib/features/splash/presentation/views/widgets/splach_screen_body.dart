import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplachScreenBody extends StatefulWidget {
  const SplachScreenBody({super.key});

  @override
  State<SplachScreenBody> createState() => _SplachScreenBodyState();
}

// Animation the text in the splach screen to slide from bottom to top when the screen is loaded
class _SplachScreenBodyState extends State<SplachScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the animation
    intailAnimation();
    // navigate to home screen after 2 seconds in 500 ms with fade transition
    navigateToHome();
  }

  // dispose the animation controller to free up resources to end the memory of this animation

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(AssetsData.logo),
          Image.asset('assets/images/logo.png', height: 50),
          SizedBox(height: 8),

          // animated builder to build the animation only not rebuild all screen
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return SlideTransition(
                position: slidingAnimation,
                child: const Text(
                  'Read Free Books',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // methods

  void intailAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      // x =0 , y=2
      begin: const Offset(0, 2),
      // end at same postion i build it in ui
      end: Offset.zero,
    ).animate(animationController);

    // start the animation
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      // Get.to(
      //   () => const HomeScreen(),
      //   transition: Transition.fade,
      //   duration: const Duration(milliseconds: 500),
      // );
      GoRouter.of(context).push('/homescreen');
    });
  }
}
