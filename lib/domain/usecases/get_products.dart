import 'package:api/domain/repositories/product_respository.dart';
import 'package:dartz/dartz.dart';
import '../entities/product.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<Either<Exception, List<Product>>> call() {
    return repository.getProducts();
  }
}
