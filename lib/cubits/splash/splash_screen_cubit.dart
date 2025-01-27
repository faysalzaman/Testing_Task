import 'package:flutter_bloc/flutter_bloc.dart';

enum SplashState { initial, loading, completed }

class SplashScreenCubit extends Cubit<SplashState> {
  SplashScreenCubit() : super(SplashState.initial);

  Future<void> initializeApp() async {
    emit(SplashState.loading);

    // Simulate initialization delay
    await Future.delayed(const Duration(seconds: 5));

    // Add any initialization logic here (e.g., checking auth status, loading initial data)

    emit(SplashState.completed);
  }
}
