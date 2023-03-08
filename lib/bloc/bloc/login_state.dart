part of 'login_bloc.dart';

enum StateProgresion { loading, success, error, none }

class LoginState extends Equatable {
  final bool isLogin;
  final String username;
  final String password;
  final StateProgresion progressin;

  const LoginState(
      {this.isLogin = false,
      this.progressin = StateProgresion.none,
      this.username = '',
      this.password = ''});

  LoginState copyWith({
    bool? isLogin,
    StateProgresion? progressin,
    String? username,
    String? password,
  }) {
    return LoginState(
        username: username ?? this.username,
        password: password ?? this.password,
        isLogin: isLogin ?? this.isLogin,
        progressin: progressin ?? this.progressin);
  }

  @override
  List<Object> get props => [isLogin, progressin, password, username];
}
