import 'package:ecommerce_testing/cubits/category/categories_cubit.dart';
import 'package:ecommerce_testing/cubits/favorites/favorites_cubit.dart';
import 'package:ecommerce_testing/cubits/product/product_cubit.dart';
import 'package:ecommerce_testing/cubits/splash/splash_screen_cubit.dart';
import 'package:ecommerce_testing/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavoriteCubit()),
        BlocProvider(create: (context) => ProductCubit()..getProducts(100)),
        BlocProvider(create: (context) => CategoryCubit()..fetchCategories()),
      ],
      child: MaterialApp(
        title: 'My Store',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: BlocProvider(
          create: (context) => SplashScreenCubit()..initializeApp(),
          child: const SplashScreen(),
        ),
      ),
    );
  }
}
