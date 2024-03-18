import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:ecommerce_app/src/constants/test_products.dart';

class FakeProductsRepository {
  //Created a singleton
  FakeProductsRepository._internal();

  static final FakeProductsRepository _instance =
      FakeProductsRepository._internal();

  factory FakeProductsRepository() {
    return _instance;
  }
  // end singleton

  final _products = kTestProducts;

  List<Product> getProductsList() {
    return _products;
  }

  Product? getProduct(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  Future<List<Product>> fetchProductsList() {
    return Future.value(_products);
  }

  Stream<List<Product>> watchProductsList() {
    return Stream.value(_products);
  }

  Stream<Product?> watchProduct(String id) {
    return watchProductsList()
        .map((products) => products.firstWhere((product) => product.id == id));
  }
}
