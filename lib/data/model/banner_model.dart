import 'package:equatable/equatable.dart';

class BannerModel extends Equatable {
  final int id;
  final String image;

  const BannerModel({required this.id, required this.image});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(id: json['id'], image: json['image']);
  }

  @override
  List<Object?> get props => [id, image];
}
