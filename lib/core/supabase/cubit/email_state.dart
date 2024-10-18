part of 'email_cubit.dart';

@immutable
sealed class EmailState {}

final class EmailInitial extends EmailState {}
final class LoadingState extends EmailState {}
final class UpdateUIState extends EmailState {}
final class ErrorState extends EmailState {}
