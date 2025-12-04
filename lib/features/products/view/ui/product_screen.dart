import 'package:flutter/material.dart';
import 'package:task_orangebayhurghada/features/banners/view/ui/banner_screen.dart';
import 'package:task_orangebayhurghada/features/products/view/ui/products_grid_view.dart';
import 'package:task_orangebayhurghada/features/products/view/widgets/product_description_card.dart';
import 'package:task_orangebayhurghada/features/products/view/widgets/product_details_card.dart';

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
            BannerScreen(),
            SliverToBoxAdapter(child: ProductDetailsCard()),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
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
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6F00),
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

              Row(
                children: [
                  buildQtyButton(Icons.add, () {}),
                  const SizedBox(width: 12),
                  const Text(
                    "1",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 12),
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
