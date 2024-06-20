import 'package:dartz/dartz.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<Either<Exception, List<Product>>> getProducts();
}
