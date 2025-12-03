// import 'package:bloc/bloc.dart';
// import 'package:task_orangebayhurghada/data/repository/repository.dart';
// import 'package:task_orangebayhurghada/features/book_home/viewmodel/newest_books/newest_books_state.dart';
//
//
// class NewestBooksCubit extends Cubit<NewestBooksState> {
//   NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
//   final Repository homeRepo;
//
//   Future<void> fetchNewestBooks() async {
//     emit(NewestBooksLoading());
//     final result = await homeRepo.fetchNewestBooks();
//     result.fold(
//       (failure) => emit(NewestBooksFailure(failure.message)),
//       (books) => emit(NewestBooksSuccess(books)),
//     );
//   }
// }
