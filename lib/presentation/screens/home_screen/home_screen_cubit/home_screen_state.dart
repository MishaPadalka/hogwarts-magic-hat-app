part of 'home_screen_cubit.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenContent extends HomeScreenState {
  final CharacterLocalModel character;

  HomeScreenContent(this.character);
}

class HomeScreenError extends HomeScreenState {
  final String errorMessage;

  HomeScreenError(this.errorMessage);
}
