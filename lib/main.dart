import 'package:api/data/datasources/remote/product_remote_data_source.dart';
import 'package:api/pressentation/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'data/repositories/product_repository_impl.dart';
import 'domain/usecases/get_products.dart';

void main() {
  final dio = Dio();
  final remoteDataSource = ProductRemoteDataSource(dio);
  final repository = ProductRepositoryImpl(remoteDataSource);
  final getProducts = GetProducts(repository);

  runApp(MyApp(getProducts: getProducts));
}

class MyApp extends StatelessWidget {
  final GetProducts getProducts;

  MyApp({required this.getProducts});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductPage(getProducts: getProducts),
    );
  }
}
