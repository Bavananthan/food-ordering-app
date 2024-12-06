import 'package:flutter/material.dart';

Image commonNetworkImageProvider(
    {required String imageUrl, double? hight = 100, double? width = 100}) {
  return Image.network(imageUrl,
      fit: BoxFit.cover,
      height: hight,
      width: width,
      frameBuilder: (_, image, loadingBuilder, __) {
        if (loadingBuilder == null) {
          return const SizedBox(
            height: 300,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return image;
      },
      loadingBuilder: (BuildContext context, Widget image,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return image;
        return SizedBox(
          height: 300,
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
      errorBuilder: (_, __, ___) => const Icon(
            Icons.error,
            size: 50,
          ));
}
