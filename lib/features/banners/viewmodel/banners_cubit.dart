import 'package:bloc/bloc.dart';
import 'package:task_orangebayhurghada/data/repository/repository.dart';
import 'package:task_orangebayhurghada/features/banners/viewmodel/banners_state.dart';

class BannersCubit extends Cubit<BannersStates> {
  BannersCubit({required this.repository}) : super(BannersInitialState());

  final Repository repository;

  Future<void> getBanners() async {
    emit(BannersLoadingState());
    final result = await repository.getBanners();
    result.fold(
      (failure) {
        emit(BannersFailureState(error: failure.message));
      },
      (banners) {
        emit(BannersSuccessState(banners: banners));
      },
    );
  }
}
