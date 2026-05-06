import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

class SearchResultsListview extends StatelessWidget {
  const SearchResultsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return BestSellerItem();
        },
        itemCount: 10,
      ),
    );
  }
}
