import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SplachScreenBody extends StatelessWidget {
  const SplachScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset(AssetsData.logo)],
      ),
    );
  }
}
