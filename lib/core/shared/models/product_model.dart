import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_order_ui/features/products/data/models/category_model.dart';

import '../../../../core/shared/entities/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductModel extends Product {
  const ProductModel({
    String? id,
    String? name,
    int? rating,
    bool? isRecommended,
    String? description,
    double? price,
    String? image,
    CategoryModel? category,
    String? categoryF,
    String? createdAt,
    bool? isDeleted,
  }) : super(
          id: id,
          categoryF: categoryF,
          name: name,
          rating: rating,
          isRecommended: isRecommended,
          description: description,
          price: price,
          image: image,
          category: category,
          createdAt: createdAt,
          isDeleted: isDeleted,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  @override
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  factory ProductModel.fromSnapshot(DocumentSnapshot snap) => ProductModel(
        id: snap.id,
        name: snap['name'],
        rating: snap['rating'],
        isRecommended: snap['isRecommended'],
        description: snap['description'],
        price: snap['price'],
        image: snap['image'],
        categoryF: snap['category'],
      );
}
