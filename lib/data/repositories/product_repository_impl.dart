import 'package:api/data/datasources/remote/product_remote_data_source.dart';
import 'package:api/data/model/product_model.dart';
import 'package:api/domain/repositories/product_respository.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/product.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Exception, List<Product>>> getProducts() async {
    try {
      final models = await remoteDataSource.fetchProducts();
      final products = models.map((model) => model.toDomain()).toList();
      return Right(products);
    } catch (e) {
      return Left(Exception('Error fetching products: $e'));
    }
  }
}
