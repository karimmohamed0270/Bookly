import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_book_card_listview.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          SizedBox(height: 5),
          BookCardListview(),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 14.0, top: 8.0),
            child: Text("Best Seller", style: Styles.textSize18),
          ),
          SizedBox(height: 10),
          BestSellerItem(),
        ],
      ),
    );
  }
}
