abstract class UserFavoriteStates {}

class UserFavoriteInitialState extends UserFavoriteStates {}


class AddLoadingFavoriteState extends UserFavoriteStates {}
class AddSuccessFavoriteState extends UserFavoriteStates {}
class AddErrorFavoriteState extends UserFavoriteStates {}

class RemoveLoadingFavoriteState extends UserFavoriteStates {}
class RemoveSuccessFavoriteState extends UserFavoriteStates {}
class RemoveErrorFavoriteState extends UserFavoriteStates {}


class GetFavoriteProductsSuccessState extends UserFavoriteStates {}
class GetFavoriteProductsLoadingState extends UserFavoriteStates {}



class ChangeFavoritesState extends UserFavoriteStates {}
