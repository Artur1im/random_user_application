part of 'random_user_bloc.dart';

sealed class RandomUserState {}

class RandomUsersFetchingListInitial extends RandomUserState {}

class RandomUsersFetchingLoadingState extends RandomUserState {}

class RandomUsersFetchingErrorState extends RandomUserState {}

class RandomUsersFetchingSuccessfulState extends RandomUserState {
  final List<RandomUser> randomUsers;
  RandomUsersFetchingSuccessfulState({
    required this.randomUsers,
  });
}
