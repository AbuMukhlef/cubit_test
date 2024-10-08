part of 'text_cubit.dart';

@immutable
sealed class TextState {}

final class TextInitial extends TextState {}

final class LoadingState extends TextState {}

final class UpdateUIState extends TextState {}

final class ErrorState extends TextState {}
