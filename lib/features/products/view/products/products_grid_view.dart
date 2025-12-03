import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_orangebayhurghada/core/utils/app_strings.dart';
import 'package:task_orangebayhurghada/data/model/product_model.dart';
import 'package:task_orangebayhurghada/features/products/viewmodel/products/products_cubit.dart';
import 'package:task_orangebayhurghada/features/products/viewmodel/products/products_state.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({super.key});

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  @override
  void initState() {
    BlocProvider.of<ProductsCubit>(context).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is ProductsLoadingState) {
          return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
        } else if (state is ProductsFailureState) {
          return SliverToBoxAdapter(child: Text(state.error));
        } else if (state is ProductsSuccessState) {
          List<ProductModel> products = state.products;
          return SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio:
                  ((MediaQuery.of(context).size.width - 26) / 2) / 360,
            ),
            itemBuilder: (context, index) {
              ProductModel product = products[index];
              return GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (_) => BookDetailsScreen(id: product.id),
                  //   ),
                  // );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. PRODUCT IMAGE
                      Expanded(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              child: Container(
                                width: double.infinity,
                                color: Colors
                                    .grey[50], // Light background for image
                                child: Image.network(
                                  "${AppStrings.marwanHoo}", // Your image URL
                                  fit: BoxFit
                                      .contain, // Changed to contain to show full jacket
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(
                                        Icons.broken_image,
                                        color: Colors.grey,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // 2. PRODUCT DETAILS
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .center, // Center align text like image
                          children: [
                            // Title
                            Text(
                              "${product.name}", // product.name
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Prices Column
                            Column(
                              children: [
                                Text(
                                  "28.000 KWD", // product.old_price
                                  style: const TextStyle(
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  "28.00 KWD", // product.price
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            // 3. ACTION BUTTONS (Buy Now + Heart)
                            Row(
                              children: [
                                // Orange Buy Button
                                Expanded(
                                  child: SizedBox(
                                    height: 35, // Fixed height for button
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .orange, // Match the image color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        padding: EdgeInsets.zero,
                                        elevation: 0,
                                      ),
                                      child: const Text(
                                        "Buy Now",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),

                                // Heart Icon
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.black54,
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: products.length,
          );
        } else {
          return SliverToBoxAdapter(child: Container());
        }
      },
    );
  }
}
