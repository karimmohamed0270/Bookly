import 'package:bookly_app/features/search/presentation/views/widgets/search_results_listview.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_text_fiels.dart';
import 'package:flutter/material.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: SearcTextField(),
        ),
        SizedBox(height: 8),

        SearchResultsListview(),
      ],
    );
  }
}
