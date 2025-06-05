import 'package:bloc_login_page/Bloc/login_event.dart';
import 'package:bloc_login_page/Bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(initialLogin()) {
    on<ButtonPressed>(_onButtonPressed);
  }

  Future<void> _onButtonPressed(
    ButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(Loading());
    await Future.delayed(const Duration(seconds: 2));
    if (event.UserName == 'srijal' && event.Password == '123') {
      emit(LoginSuccess());
    } else {
      emit(LoginFailure());
    }
  }
}
