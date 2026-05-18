// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// class BookCard extends StatelessWidget {
//   const BookCard({super.key, required this.imageUrl});

//   final String imageUrl;

//   @override
//   Widget build(BuildContext context) {
//     // Correctly upgrade the unsecure google books URL to the secure usercontent domain
//     final secureImageUrl = imageUrl.startsWith('http://')
//         ? imageUrl.replaceFirst('http://', 'https://')
//         : imageUrl;

//     print('Secure Image URL: $secureImageUrl');

//     return AspectRatio(
//       aspectRatio: 2.7 / 4,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16),
//         child: CachedNetworkImage(
//           imageUrl: secureImageUrl,
//           fit: BoxFit.cover,
//           placeholder: (context, url) =>
//               const Center(child: CircularProgressIndicator()),
//           errorWidget: (context, url, error) =>
//               const Icon(Icons.book, size: 40, color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return const Icon(Icons.book, size: 40, color: Colors.white);
    }

    final secureImageUrl = imageUrl.replaceFirst('http://', 'https://');

    print(secureImageUrl);

    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          secureImageUrl,
          fit: BoxFit.cover,

          errorBuilder: (context, error, stackTrace) {
            print(error);

            return const Icon(Icons.book, size: 40, color: Colors.white);
          },

          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
