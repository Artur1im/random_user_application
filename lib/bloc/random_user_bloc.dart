import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:random_user_application/api/random_user_api.dart';
import 'package:random_user_application/model/random_user_model.dart';

part 'random_user_state.dart';
part 'random_user_event.dart';

class RandomUserListBloc extends Bloc<RandomUserEvent, RandomUserState> {
  List<RandomUser> randomUsers = [];

  RandomUserListBloc() : super(RandomUsersFetchingListInitial()) {
    on<RandomUserFetchListInitial>(randomUserInitialFetchEvent);
    on<RandomUserLoadMore>(randomUserLoadMore);
  }

  FutureOr<void> randomUserInitialFetchEvent(
    RandomUserFetchListInitial event,
    Emitter<RandomUserState> emit,
  ) async {
    emit(RandomUsersFetchingLoadingState());
    await _requestAndAddRandomUser();
    emit(RandomUsersFetchingSuccessfulState(randomUsers: randomUsers));
  }

  FutureOr<void> randomUserLoadMore(
    RandomUserLoadMore event,
    Emitter<RandomUserState> emit,
  ) async {
    await _requestFetchMore();
    emit(RandomUsersFetchingSuccessfulState(randomUsers: randomUsers));
  }

  FutureOr<void> _requestAndAddRandomUser() async {
    randomUsers.clear();

    List<RandomUser> list = await RandomUserApi().randomUsers(count: 100);

    randomUsers.addAll(list);
  }

  FutureOr<void> _requestFetchMore() async {
    List<RandomUser> list = await RandomUserApi().randomUsers(count: 100);

    randomUsers.addAll(list);
  }
}
