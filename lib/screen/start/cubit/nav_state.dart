part of 'nav_cubit.dart';

@immutable
sealed class NavState {}

final class NavInitial extends NavState {}
final class LoadingState extends NavState {}
final class UpdateUIState extends NavState {}
final class ErrorState extends NavState {}
