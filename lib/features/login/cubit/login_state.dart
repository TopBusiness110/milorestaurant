abstract class LoginState {}

class InitLoginState extends LoginState {}

class ChangePasswordState extends LoginState {}

class UserState extends LoginState {}
class DriverState extends LoginState {}
class ConfigLoading extends LoginState {}
class ConfigError extends LoginState {}
class ConfigLoaded extends LoginState {}
