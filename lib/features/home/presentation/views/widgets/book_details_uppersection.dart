import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/bbok_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/bookdetails_appbar.dart';
import 'package:flutter/material.dart';

class BookDetailsUpperSection extends StatelessWidget {
  const BookDetailsUpperSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: BookDetailsAppBar(),
        ),
        //  image
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .32),
          child: AspectRatio(
            // add padding because the image is too big and we want to make it smaller and also to make it responsive to different screen sizes
            // aspect ratio take percentage from the  width
            // if i dont give it awidth depend on padding it will take all the available space and it will be too big and not responsive
            aspectRatio: 2.7 / 4,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsData.testBook),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),

        // title and subtitle
        const SizedBox(height: 10),

        Text("Jaratin Roles", style: Styles.textStyle30),
        Text(
          "Amr Abadien",
          style: Styles.textSize18.copyWith(color: Colors.grey),
        ),
        const SizedBox(height: 5),
        // rating
        BestSellerRating(),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38),
          child: BookAction(),
        ),
      ],
    );
  }
}
