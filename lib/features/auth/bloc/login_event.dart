part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  final String email;
  final String password;
  const LoginEvent({this.email, this.password});
  @override
  List<Object> get props => [email, email];
}

class OnLoginEvent extends LoginEvent {
  final String email;
  final String password;
  const OnLoginEvent({this.email, this.password});
  @override
  List<Object> get props => [email, email];
}
