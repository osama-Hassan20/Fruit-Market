abstract class UserAccountStates {}

class UserAccountInitialState extends UserAccountStates {}


class GetUserAccountLoadingState extends UserAccountStates{}

class GetUserAccountSuccessState extends UserAccountStates{}

class GetUserAccountErrorState extends UserAccountStates
{
  final String error;

  GetUserAccountErrorState(this.error);
}