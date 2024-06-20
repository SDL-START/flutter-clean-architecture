import 'package:api/pressentation/bloc/product_bloc.dart';
import 'package:api/pressentation/widget/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_products.dart';

class ProductPage extends StatelessWidget {
  final GetProducts getProducts;

  ProductPage({required this.getProducts});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc(getProducts)..add(FetchProductsEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text('Products')),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductLoaded) {
              return ProductList(products: state.products);
            } else if (state is ProductError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
