// import 'package:flutter/material.dart';
// import 'package:task_orangebayhurghada/core/utils/app_strings.dart';
// import 'package:task_orangebayhurghada/features/books_details/view/book_details_screen.dart';
//
// class BestSellerListViewItem extends StatelessWidget {
//   const BestSellerListViewItem({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (){
//         //Navigator.of(context).push(MaterialPageRoute(builder: (_)=> BookDetailsScreen()));
//       },
//       child: Container(
//         height: 120,
//         child: Row(
//           children: [
//             AspectRatio(
//               aspectRatio: 2.5 / 4,
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.white,
//                   image: DecorationImage(
//                     image: NetworkImage(AppStrings.marwanHoo),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(width: 20),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.5,
//                     child: Text(
//                       "dfdkfkdsfkksdfkdffjdksfkdfkkfksdfksdkffdfdffjdksfkdfkkfksdfksdkffdfdffjdksfkdfkkfksdfksdkffdfdfjdksfkdfkkfksdfksdkffdfdfdffdf",
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   Text("<data>"),
//                   SizedBox(height: 5),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("Price"),
//                       Row(
//                         children: [
//                           Icon(Icons.star, color: Colors.yellow),
//                           SizedBox(width: 5),
//                           Text("4.5"),
//                           SizedBox(width: 5),
//                           Text("(239)"),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
