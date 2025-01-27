part of 'product_cubit.dart';

enum ProductsStatus { initial, loading, success, error }

class ProductState {
  final List<Product> products;
  final List<Product> filteredProducts;
  final ProductsStatus status;
  final String? error;
  final String searchQuery;

  ProductState({
    this.products = const [],
    this.filteredProducts = const [],
    this.status = ProductsStatus.initial,
    this.error,
    this.searchQuery = '',
  });

  ProductState copyWith({
    List<Product>? products,
    List<Product>? filteredProducts,
    ProductsStatus? status,
    String? error,
    String? searchQuery,
  }) {
    return ProductState(
      products: products ?? this.products,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      status: status ?? this.status,
      error: error,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
