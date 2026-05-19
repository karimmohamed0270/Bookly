import 'package:bookly_app/core/utils/widgets/custom_btn.dart';
import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookmodel});
  final BookModel bookmodel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomBtn(
            onPressed: () => print("Buy Now"),
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
            // when i press the button it will open the preview link of the book in the browser
            onPressed: () async {
              Uri url = Uri.parse(bookmodel.volumeInfo?.previewLink ?? '');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Could not launch the preview link'),
                  ),
                );
              }
            },
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
