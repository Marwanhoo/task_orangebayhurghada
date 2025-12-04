import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsCard extends StatelessWidget {
  const ProductDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Elegant Men's Fleece Lined Hooded Jacket",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "63.000 KWD",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "25.200 KWD",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  "60%",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          const Divider(height: 1, thickness: 0.5),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Brand : Ateej", // 'Atiq' or 'Ateej' based on translation
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text("More", style: TextStyle(color: Colors.grey[700])),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.grey[700],
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          const Divider(height: 1, thickness: 0.5),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "SKU: 6974321040059",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              Row(
                children: [
                  const Text(
                    "3 Reviews",
                    style: TextStyle(
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 4),
                  RatingBar.builder(
                    itemSize: 16,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, _) {
                      return Icon(Icons.star, color: Colors.amber);
                    },
                    onRatingUpdate: (rating) {},
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}
