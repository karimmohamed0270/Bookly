import 'package:bookly_app/features/home/presentation/views/widgets/book_card_listview.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [CustomAppBar(), SizedBox(height: 5), BookCardListview()],
      ),
    );
  }
}
