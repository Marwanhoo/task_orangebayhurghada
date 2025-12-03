import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_orangebayhurghada/core/utils/app_strings.dart';
import 'package:task_orangebayhurghada/features/product_details/viewmodel/product_details_cubit.dart';
import 'package:task_orangebayhurghada/features/product_details/viewmodel/product_details_state.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int id;
  const ProductDetailsScreen({super.key, required this.id});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductDetailsCubit>(
      context,
    ).getProductDetails(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: BlocConsumer<ProductDetailsCubit, ProductDetailsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProductDetailsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductDetailsFailureState) {
            return Text(state.error);
          } else if (state is ProductDetailsSuccessState) {
            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 400,
                      pinned: true,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      leading: IconButton(
                        icon: const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.arrow_back, color: Colors.black),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      actions: [
                        IconButton(
                          icon: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.favorite, color: Colors.black),
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 10),
                      ],
                      flexibleSpace: FlexibleSpaceBar(
                        background: Image.network(
                          AppStrings.marwanHoo,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(
                                child: Icon(Icons.broken_image, size: 50),
                              ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                        transform: Matrix4.translationValues(
                          0,
                          -20,
                          0,
                        ), // Overlap effect
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Center Handle (Visual indicator)
                            Center(
                              child: Container(
                                width: 50,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Brand & Rating
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "BRAND",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "r",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      " reviews",
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),

                            // Title
                            Text(
                              "Product Name",
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 15),

                            // Attributes Grid (Material, Length, Category)
                            Row(
                              children: [
                                _buildAttributeChip("Material", "N/A"),
                                const SizedBox(width: 10),
                                _buildAttributeChip("Length", "N/A"),
                                const SizedBox(width: 10),
                                _buildAttributeChip("Category", "N/A"),
                              ],
                            ),
                            const SizedBox(height: 20),

                            // Description
                            const Text(
                              "Description",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "No description available.",
                              style: TextStyle(
                                color: Colors.grey[600],
                                height: 1.5,
                                fontSize: 14,
                              ),
                            ),

                            const SizedBox(height: 100), // Space for bottom bar
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(
                            alpha: 0.05,
                          ), // Updated .withValues
                          blurRadius: 10,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Price Column
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "originalPrice",
                              style: TextStyle(
                                color: Colors.grey[400],
                                decoration: TextDecoration.lineThrough,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "currentPrice",
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        // Buy Button
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: Add to cart logic
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              "Add to Cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return SliverToBoxAdapter(child: Container());
          }
        },
      ),
    );
  }

  Widget _buildAttributeChip(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[500], fontSize: 10)),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
