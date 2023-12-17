part of 'random_user_bloc.dart';

sealed class RandomUserEvent {}

class RandomUserLoadMore extends RandomUserEvent {}

class RandomUserFetchListInitial extends RandomUserEvent {}
