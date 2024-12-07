import 'package:ecologital/provider/locator.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;
  final int price;
  final bool isPromotionAvailable;
  final VoidCallback onTab;
  const FoodCard(
      {super.key,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.price,
      required this.isPromotionAvailable,
      required this.onTab});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                // decoration:
                //     BoxDecoration(borderRadius: BorderRadius.circular(100)),
                // height: 70,
                // width: 70,
                child: Image.network(imageUrl,
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
                        ))),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: texts.textSize14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  description,
                  style: TextStyle(fontSize: texts.textSize12),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '\$ ${price}',
                      style: TextStyle(
                          fontSize: texts.textSize14, color: color.baseColor),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    if (isPromotionAvailable)
                      Flexible(
                        child: Container(
                          color: color.yellow,
                          child: const Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(" Promotions Available "),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
