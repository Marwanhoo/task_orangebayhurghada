import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String name;

  const ProductModel({required this.id, required this.name});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(id: json['id'], name: json['name']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}
