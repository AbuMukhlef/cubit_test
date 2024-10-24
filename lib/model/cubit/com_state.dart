part of 'com_cubit.dart';

@immutable
sealed class ComState {}

final class ComInitial extends ComState {}

final class LoadingState extends ComState {}

final class UpdateState extends ComState {}
