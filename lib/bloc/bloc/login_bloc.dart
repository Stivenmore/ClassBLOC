import 'package:bloc/bloc.dart';
import 'package:bloc_demo/data/user_repo.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepo _userRepo;
  LoginBloc(UserRepo userRepo)
      : _userRepo = userRepo,
        super(const LoginState()) {
    on<LoginUser>((event, emit) {
      emit(state.copyWith(username: event.value));
    });
    on<LoginPass>((event, emit) {
      emit(state.copyWith(password: event.value));
    });
    on<LoginSubmit>((event, emit) async {
      emit(state.copyWith(progressin: StateProgresion.loading));
      if (state.username.isNotEmpty || state.password.isNotEmpty) {
        final data =
            await _userRepo.login(user: state.username, pass: state.password);
        if (data) {
          emit(state.copyWith(progressin: StateProgresion.success));
        } else {
          emit(state.copyWith(progressin: StateProgresion.error));
        }
      } else {
        emit(state.copyWith(progressin: StateProgresion.error));
      }
    });
    on<LoginReset>((event, emit) {
      emit(state.copyWith(progressin: StateProgresion.none));
    });
  }
}
