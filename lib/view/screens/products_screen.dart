import 'package:ecommerce_testing/cubits/product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/product_card.dart';
import '../widgets/search_text_field.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductsView();
  }
}

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Products',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Search Bar
              SearchTextField(
                hintText: 'Search products...',
                onChanged: (value) {
                  context.read<ProductCubit>().searchProducts(value);
                },
              ),
              const SizedBox(height: 8),
              // Results count
              BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  return Text(
                    '${state.filteredProducts.length} results found',
                    style: TextStyle(color: Colors.grey[600]),
                  );
                },
              ),
              const SizedBox(height: 16),
              // Products List
              Expanded(
                child: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    if (state.status == ProductsStatus.loading) {
                      return ListView.builder(
                        itemCount: 6, // Show 6 shimmer cards while loading
                        itemBuilder: (context, index) {
                          return const ShimmerLoadingCard();
                        },
                      );
                    }
                    if (state.status == ProductsStatus.error) {
                      return Center(child: Text(state.error!));
                    }
                    return ListView.builder(
                      itemCount: state.filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = state.filteredProducts[index];
                        return ProductCard(product: product);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
