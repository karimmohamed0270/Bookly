import 'package:bookly_app/core/utils/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomBtn(
            backgroundColor: Colors.white,
            text: "19.99 \$",
            textcolor: Colors.black,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),

        Expanded(
          child: CustomBtn(
            backgroundColor: Colors.orangeAccent,
            text: "Free Perview",
            textcolor: Colors.black,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}
