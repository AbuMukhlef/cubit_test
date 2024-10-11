part of 'menu_cubit.dart';

@immutable
sealed class MenuState {}

final class MenuInitial extends MenuState {}
final class LoadingState extends MenuState {}
final class UpdateUIState extends MenuState {
  final String? search;

  UpdateUIState({required this.search});
}
final class ErrorState extends MenuState {}
