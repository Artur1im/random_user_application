import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'random_user_event.dart';
part 'random_user_state.dart';

class RandomUserBloc extends Bloc<RandomUserEvent, RandomUserState> {
  RandomUserBloc() : super(RandomUserInitial()) {
    on<RandomUserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
