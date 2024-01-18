part of 'home_screen_cubit.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenEvent extends HomeScreenState {}

class HomeScreenContent extends HomeScreenState {
  final CharacterLocalModel character;
  final GuessesAmountModel guesses;

  HomeScreenContent(this.character, this.guesses);
}

class HomeScreenError extends HomeScreenState {
  final String errorMessage;

  HomeScreenError(this.errorMessage);
}
