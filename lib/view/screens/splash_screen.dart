// ignore_for_file: sized_box_for_whitespace

import 'package:ecommerce_testing/cubits/splash/splash_screen_cubit.dart';
import 'package:ecommerce_testing/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenCubit()..initializeApp(),
      child: BlocListener<SplashScreenCubit, SplashState>(
        listener: (context, state) {
          if (state == SplashState.completed) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          }
        },
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img_splash.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Color(0xFF4A6670), // Teal-grey overlay
                  BlendMode.multiply, // This will create an overlay effect
                ),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Store Title with custom styling
                    Container(
                      margin: const EdgeInsets.only(top: 100),
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: const Text(
                        'My Store',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontFamily: 'Playfair Display',
                          letterSpacing: 1.2,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 2),
                              blurRadius: 4,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Welcome section container
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: Column(
                        children: [
                          const Text(
                            'Valkommen',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: 0.5,
                              shadows: [
                                Shadow(
                                  offset: Offset(0, 1),
                                  blurRadius: 2,
                                  color: Colors.black26,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: const Text(
                              'Hos ass kan du baka tid has nastan alla Sveriges salonger och motagningar. Baka frisor, massage, skonhetsbehandingar, friskvard och mycket mer.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                height: 1.5,
                                letterSpacing: 0.3,
                                shadows: [
                                  Shadow(
                                    offset: Offset(0, 1),
                                    blurRadius: 2,
                                    color: Colors.black26,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
