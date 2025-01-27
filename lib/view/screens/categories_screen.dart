import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../cubits/category/categories_cubit.dart';
import '../widgets/category_card.dart';
import '../widgets/search_text_field.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoriesView();
  }
}

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

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
                'Categories',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Search Bar
              SearchTextField(
                hintText: 'Search categories...',
                onChanged: (value) {
                  context.read<CategoryCubit>().searchCategories(value);
                },
              ),
              const SizedBox(height: 8),
              // Results count
              BlocBuilder<CategoryCubit, CategoriesState>(
                builder: (context, state) {
                  return Text(
                    '${state.filteredCategories.length} categories found',
                    style: TextStyle(color: Colors.grey[600]),
                  );
                },
              ),
              const SizedBox(height: 16),
              // Categories Grid
              Expanded(
                child: BlocBuilder<CategoryCubit, CategoriesState>(
                  builder: (context, state) {
                    if (state.status == CategoriesStatus.loading) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1.1,
                        ),
                        itemCount: 6, // Show 6 shimmer items while loading
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    if (state.status == CategoriesStatus.error) {
                      return Center(child: Text(state.error!));
                    }
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.1,
                      ),
                      itemCount: state.filteredCategories.length,
                      itemBuilder: (context, index) {
                        final category = state.filteredCategories[index];
                        return CategoryCard(category: category);
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
