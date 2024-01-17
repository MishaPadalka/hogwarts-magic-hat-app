part of 'splash_screen_cubit.dart';

@immutable
abstract class SplashScreenState {}

class SplashScreenInitial extends SplashScreenState {}

class SplashScreenLoading extends SplashScreenState {}

class SplashScreenLoaded extends SplashScreenState {}

class SplashScreenError extends SplashScreenState {
  final String errorMessage;

  SplashScreenError(this.errorMessage);
}
