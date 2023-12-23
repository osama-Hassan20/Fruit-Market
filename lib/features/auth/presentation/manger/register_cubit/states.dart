
abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates{}

class RegisterErrorState extends RegisterStates{
  final String error;
  RegisterErrorState(this.error);
}
class CreateSuccessState extends RegisterStates{
  final String uId;
  CreateSuccessState(this.uId);
}

class CreateErrorState extends RegisterStates{
  final String error;
  CreateErrorState(this.error);
}

class RChangePasswordVisibilityState extends RegisterStates{}


class GenderSelectedState extends RegisterStates{}

class IsAdminSelectedState extends RegisterStates{}
