import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer(
      {Key? key, required this.imageUrl, this.scale = 1, this.loadingColor})
      : super(key: key);

  final String imageUrl;
  final double scale;
  final Color? loadingColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: Image.network(
        imageUrl,
        fit: BoxFit.fill,
        scale: scale,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              color: loadingColor,
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      ),
    );
  }
}
