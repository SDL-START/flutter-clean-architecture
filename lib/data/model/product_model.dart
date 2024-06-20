import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/product.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String name,
    required String image,
    required String company,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  factory ProductModel.fromDomain(Product product) {
    return ProductModel(
      name: product.name,
      image: product.image,
      company: product.company,
    );
  }
}

// Extend the Freezed-generated class with a custom method
extension ProductModelX on ProductModel {
  Product toDomain() {
    return Product(
      name: name,
      image: image,
      company: company,
    );
  }
}
