part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

class SuffixChangeState extends AppState {}

final class BNBChangeState extends AppState {}

// LOGIN STATES
class LoadingLoginState extends AppState {}

class ErrorLoginState extends AppState {}

class SuccessLoginState extends AppState {}

// REGISTER STATES
class LoadingRegisterState extends AppState {}

class ErrorRegisterState extends AppState {}

class SuccessRegisterState extends AppState {}