part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class ConfigLoaded extends RegisterState {}
class ConfigError extends RegisterState {}
class ConfigLoading extends RegisterState {}
class PackgesLoaded extends RegisterState {}
class PackgesError extends RegisterState {}
class PackgesLoading extends RegisterState {}
