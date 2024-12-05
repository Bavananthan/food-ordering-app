import 'package:ecologital/provider/locator.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
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
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Price: $price',
                    ),
                    if (isPromotionAvailable)
                      Container(
                        color: color.yellow,
                        child: Text("2 Promotions Available"),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
