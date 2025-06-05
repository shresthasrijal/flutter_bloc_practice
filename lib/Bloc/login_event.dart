abstract class LoginEvent {}

class ButtonPressed extends LoginEvent {
  final String UserName;
  final String Password;

  ButtonPressed({required this.UserName, required this.Password});
}
