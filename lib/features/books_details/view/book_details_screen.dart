// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:task_orangebayhurghada/core/utils/app_strings.dart';
// import 'package:task_orangebayhurghada/data/model/book_model.dart';
// import 'package:task_orangebayhurghada/features/books_details/viewmodel/book_details_cubit.dart';
// import 'package:task_orangebayhurghada/features/books_details/viewmodel/book_details_state.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class BookDetailsScreen extends StatefulWidget {
//   final String id;
//   const BookDetailsScreen({super.key, required this.id});
//
//   @override
//   State<BookDetailsScreen> createState() => _BookDetailsScreenState();
// }
//
// class _BookDetailsScreenState extends State<BookDetailsScreen> {
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<BookDetailsCubit>(context).getBookDetails(id: widget.id);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actionsPadding: EdgeInsetsDirectional.only(end: 10.0),
//         title: Text("Book Details"),
//       ),
//       body: BlocConsumer<BookDetailsCubit, BookDetailsStates>(
//         listener: (context, state) {
//           if (state is BookDetailsSuccessState) {
//             // BlocProvider.of<SimilarBooksCubit>(context).getSimilarBooks(
//             //   subject: state.book.categories?.first ?? '',
//             // );
//           }
//         },
//         builder: (context, state) {
//           if (state is BookDetailsLoadingState) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is BookDetailsFailureState) {
//             return Column(
//               children: [
//                 Center(child: Text(state.error)),
//                 //SimilarBooksListView(),
//               ],
//             );
//           } else if (state is BookDetailsSuccessState) {
//             BookModel book = state.book;
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 spacing: 10,
//                 children: [
//                   Container(
//                     alignment: Alignment.center,
//                     height: MediaQuery.of(context).size.height * 0.3,
//                     child: AspectRatio(
//                       aspectRatio: 2.5 / 4,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.white,
//                           image: DecorationImage(
//                             image: NetworkImage("${book.thumbnail}"),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Text(
//                     textAlign: TextAlign.center,
//                     "${book.title}",
//                     style: Theme.of(context).textTheme.headlineMedium,
//                   ),
//                   Opacity(
//                     opacity: 0.7,
//                     child: Text(
//                       textAlign: TextAlign.center,
//
//                       "${book.subtitle}",
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.date_range, color: Colors.orangeAccent),
//                       SizedBox(width: 5),
//                       Text("${book.publishedDate}"),
//                     ],
//                   ),
//                   BooksAction(
//                     bookModel: book,
//                   ),
//                   Align(
//                     alignment: AlignmentDirectional.centerStart,
//                     child: Text("You can also like"),
//                   ),
//                  // Text(book.categories?.first ?? "No Category"),
//                 ],
//               ),
//             );
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }
// }
//
// class BooksAction extends StatelessWidget {
//   const BooksAction({super.key, required this.bookModel});
// final BookModel bookModel;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: CustomButton(
//               onPressed: (){},
//               backgroundColor: Colors.white,
//               textColor: Colors.black,
//               text: "Free",
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(16),
//                 bottomLeft: Radius.circular(16),
//               ),
//             ),
//           ),
//           Expanded(
//             child: CustomButton(
//               onPressed: ()async{
//                 final Uri _url = Uri.parse("${bookModel.previewLink}");
//                 if (!await launchUrl(_url)) {
//                 throw Exception('Could not launch $_url');
//                 }
//               },
//               backgroundColor: Colors.orangeAccent,
//               textColor: Colors.white,
//               text: "Free Preview",
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(16),
//                 bottomRight: Radius.circular(16),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CustomButton extends StatelessWidget {
//   const CustomButton({
//     super.key,
//     required this.backgroundColor,
//     required this.textColor,
//     required this.text,
//     required this.borderRadius,
//     required this.onPressed,
//   });
//
//   final Color backgroundColor;
//   final Color textColor;
//   final String text;
//   final BorderRadius borderRadius;
//   final VoidCallback onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50,
//       child: TextButton(
//         style: TextButton.styleFrom(
//           backgroundColor: backgroundColor,
//           shape: RoundedRectangleBorder(borderRadius: borderRadius),
//         ),
//         onPressed: onPressed,
//         child: Text(text, style: TextStyle(color: textColor)),
//       ),
//     );
//   }
// }
