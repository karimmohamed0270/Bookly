import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(
        children: [
          Image.asset(AssetsData.logo, height: 18),
          Expanded(child: SizedBox()),
          IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 26)),
        ],
      ),
    );
  }
}
