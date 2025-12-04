import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final String image;
  final String price;
  final String? discountPrice;
  final String brand;
  final String material;
  final String length;
  final double averageRating;
  final bool isFavorite;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.discountPrice,
    required this.brand,
    required this.material,
    required this.length,
    required this.averageRating,
    required this.isFavorite,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      discountPrice: json['discount_price'],
      brand: json['brand'],
      material: json['material'],
      length: json['length'],
      averageRating: json['average_rating'],
      isFavorite: json['is_favorite'],
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    image,
    price,
    discountPrice,
    brand,
    material,
    length,
    averageRating,
    isFavorite,
  ];
}

final ProductModel dummyProduct = ProductModel(
  id: 0,
  name: 'Loading Product Name...',
  description: 'Loading description text lines for skeleton effect...',
  image: '',
  price: '00.00',
  discountPrice: '00.00',
  brand: 'Brand',
  material: 'Material',
  length: 'Length',
  averageRating: 0,
  isFavorite: false,
);
