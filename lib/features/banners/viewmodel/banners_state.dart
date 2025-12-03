import 'package:equatable/equatable.dart';
import 'package:task_orangebayhurghada/data/model/banner_model.dart';

abstract class BannersStates extends Equatable {
  const BannersStates();
  @override
  List<Object?> get props => [];
}

class BannersInitialState extends BannersStates {}

class BannersLoadingState extends BannersStates {}

class BannersSuccessState extends BannersStates {
  final List<BannerModel> banners;
  const BannersSuccessState({required this.banners});
}

class BannersFailureState extends BannersStates {
  final String error;
  const BannersFailureState({required this.error});
}
