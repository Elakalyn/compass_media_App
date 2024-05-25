part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

// MISC STATES

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

// GET ARTICLES STATES
class LoadingGetArticlesState extends AppState {}

class ErrorGetArticlesState extends AppState {}

class SuccessGetArticlesState extends AppState {}

class LoadMoreArticlesState extends AppState {}

// SEARCH STATES
class LoadingSearchState extends AppState {}

class ErrorSearchState extends AppState {}

class SuccessSearchState extends AppState {}

// SEARCH STATES
class AddBookmarkState extends AppState {}

class RemoveBookmarkState extends AppState {}

class ErrorBookmarkState extends AppState {}
