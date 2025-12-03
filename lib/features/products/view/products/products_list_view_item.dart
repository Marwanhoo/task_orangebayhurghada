// import 'package:flutter/material.dart';
// import 'package:task_orangebayhurghada/core/utils/app_strings.dart';
// import 'package:task_orangebayhurghada/data/model/product_model.dart';
//
// class ProductsListViewItem extends StatelessWidget {
//   const ProductsListViewItem({super.key, required this.productModel});
//   final ProductModel productModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 2.5 / 4,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16),
//         child: Image.network(
//          // productModel.thumbnail ?? "",
//           "${AppStrings.marwanHoo}",
//           fit: BoxFit.fill,
//           errorBuilder: (context, error, stackTrace) {
//             return Container(
//               color: Colors.grey[200],
//               child: const Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.broken_image, size: 30, color: Colors.grey),
//                   SizedBox(height: 4),
//                   Text(
//                     "No Image",
//                     style: TextStyle(fontSize: 10, color: Colors.grey),
//                   ),
//                 ],
//               ),
//             );
//           },
//
//           // 3. Optional: Show a loader while waiting
//           loadingBuilder: (context, child, loadingProgress) {
//             if (loadingProgress == null) return child;
//             return const Center(child: CircularProgressIndicator());
//           },
//         ),
//       ),
//     );
//   }
// }
