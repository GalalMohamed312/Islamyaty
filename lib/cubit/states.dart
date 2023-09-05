abstract class HomeStates{}
class HomeInitialStates extends HomeStates{}
class HomeChangeBottomNavBarState extends HomeStates{}
class ChangeVisibilityState extends HomeStates{}
class ChangeCommunityState extends HomeStates{}
class AppNotification extends HomeStates{}
class SignInLoadingState extends HomeStates{}
class SignInSuccessState extends HomeStates{
  // final  PlantLoginModel plantLoginModel;

  SignInSuccessState();
}
class SignInErrorState extends HomeStates{
  final String error;
  SignInErrorState(this.error);
}
class ChangeViewState extends HomeStates{}
class ChangeTafseerState extends HomeStates{}