import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_orangebayhurghada/core/utils/app_strings.dart';
import 'package:task_orangebayhurghada/features/products/view/ui/products_grid_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(toolbarHeight: 0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            //SliverToBoxAdapter(child: CustomTabBar()),
            SliverToBoxAdapter(child: CustomPageView()),
            SliverToBoxAdapter(child: ProductDetailsCard()),
            SliverToBoxAdapter(child: ProductDescriptionCard()),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text("Similar items"),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
              ),
            ),
            ProductsGridView(),
          ],
        ),
      ),
      persistentFooterButtons: [
        Container(
          width: double.infinity, // Ensures the row takes full width
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              // 1. Buy Now Button (Expanded)
              Expanded(
                child: SizedBox(
                  height: 50, // Fixed height matches the design
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6F00), // Deep Orange
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Buy Now",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // 2. Quantity Selector
              Row(
                children: [
                  // Plus Button
                  buildQtyButton(Icons.add, () {}),

                  // Quantity Count
                  const SizedBox(width: 12),
                  const Text(
                    "1",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 12),

                  // Minus Button
                  buildQtyButton(Icons.remove, () {}),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget buildQtyButton(IconData icon, VoidCallback onTap) {
  return Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      color: Colors.grey[300], // Light grey background
      borderRadius: BorderRadius.circular(6),
    ),
    child: IconButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      icon: Icon(icon, color: Colors.black87),
    ),
  );
}

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Column(
      children: [
        SizedBox(
          //height: 175,
          height: MediaQuery.of(context).size.height / 5,
          child: PageView.builder(
            controller: pageController,
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(20.0),
                onTap: () async {
                  if (!await launchUrl(Uri.parse('https://flutter.dev'))) {
                    throw Exception('Could not launch');
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      loadingBuilder: (_, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                      image: NetworkImage(AppStrings.marwanHoo),
                      fit: BoxFit.cover,
                      height: 175,
                      width: double.infinity,
                    ),
                  ),
                ),
              );
            },
            itemCount: 4,
          ),
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: 4,
          effect: const WormEffect(
            activeDotColor: Colors.red,
            dotColor: Colors.grey,
            dotHeight: 15,
            dotWidth: 15,
          ),
          onDotClicked: (index) {},
        ),
      ],
    );
  }
}

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
        mainAxisSize: MainAxisSize.min, // Wrap content height
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Title
          const Text(
            "Elegant Men's Fleece Lined Hooded Jacket",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),

          // 2. Price and Discount Row
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
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
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

          const SizedBox(height: 16),
          const Divider(height: 1, thickness: 0.5),
          const SizedBox(height: 12),

          // 3. Brand Row
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

          // 4. Footer (SKU and Rating)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SKU
              const Text(
                "SKU: 6974321040059",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              // Rating
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
                  // Star Icons
                  RatingBar.builder(
                    itemSize: 16,
                    //initialRating: 3,
                    //minRating: 1,
                    direction: Axis.horizontal,
                    //allowHalfRating: true,
                    itemCount: 5,
                    // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) =>
                        Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (rating) {
                      //print(rating);
                    },
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

class ProductDescriptionCard extends StatelessWidget {
  const ProductDescriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),

            // The Title (Always visible)
            title: const Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            // The Arrow Icon (Custom color)
            iconColor: Colors.grey[600],
            collapsedIconColor: Colors.grey[600],

            // The Content (Visible only when expanded)
            children: [
              const Text(
                "Elegant winter jacket for men with detachable hood - warm, practical and versatile for business or outdoor activities",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const ProductSpecRow(
                label: "Material",
                value: "Polyester fiber (Polyester)",
              ),
              const ProductSpecRow(
                label: "Composition",
                value: "100% Polyester fiber (Polyester)",
              ),
              const ProductSpecRow(label: "Length", value: "Regular"),
              const ProductSpecRow(
                label: "Sleeve Length",
                value: "Long Sleeve",
              ),
              const ProductSpecRow(
                label: "Sleeve Type",
                value: "Raglan Sleeves",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductSpecRow extends StatelessWidget {
  final String label;
  final String value;

  const ProductSpecRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}
