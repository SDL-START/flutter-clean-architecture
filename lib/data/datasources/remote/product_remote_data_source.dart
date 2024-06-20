import 'package:api/data/model/product_model.dart';
import 'package:dio/dio.dart';

class ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSource(this.dio);

  Future<List<ProductModel>> fetchProducts() async {
    final response = await dio.get(
      'https://38131617-f04a-4ace-8d64-29b115a9babf-00-1999i2zqedalj.pike.replit.dev/products',
    );
    print('object: ${response.statusCode}');
    print('object1 ${response.data}');
    if (response.statusCode == 200) {
      List data = response.data as List;
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
