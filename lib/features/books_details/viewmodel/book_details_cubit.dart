// import 'package:bloc/bloc.dart';
// import 'package:task_orangebayhurghada/data/repository/repository.dart';
// import 'package:task_orangebayhurghada/features/books_details/viewmodel/book_details_state.dart';
//
// class BookDetailsCubit extends Cubit<BookDetailsStates> {
//   BookDetailsCubit(this.homeRepo) : super(BookDetailsInitial());
//   final Repository homeRepo;
//
//   Future<void> getBookDetails({required String id}) async {
//     emit(BookDetailsLoadingState());
//     final result = await homeRepo.getBookDetails(id: id);
//     result.fold(
//       (failure) => emit(BookDetailsFailureState(failure.message)),
//       (books) {
//         emit(BookDetailsSuccessState(books));
//       },
//     );
//   }
// }
