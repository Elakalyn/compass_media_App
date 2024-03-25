part of 'user_profile_cubit.dart';

@immutable
sealed class UserProfileCubitState {}

final class UserProfileCubitInitial extends UserProfileCubitState {}

class TopicSelectionState extends UserProfileCubitState {}

class SourceSelectionState extends UserProfileCubitState {}

class SetProfileLoadingState extends UserProfileCubitState {}

class SetProfileSuccessState extends UserProfileCubitState {}

class SetProfileErrorState extends UserProfileCubitState {}

class SetCountryState extends UserProfileCubitState {}

class GetProfileLoadingState extends UserProfileCubitState {}

class GetProfileSuccessState extends UserProfileCubitState {}

class GetProfileErrorState extends UserProfileCubitState {}

class ChangeProfileGridState extends UserProfileCubitState {}
