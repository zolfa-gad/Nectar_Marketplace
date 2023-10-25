abstract class CartsState {}

class CartsInitialState extends CartsState {}

class CartsGetCartsListSuccessState extends CartsState {}

class CartsGetCartsListErrorState extends CartsState {}

class CartsGetCartsListLoadingState extends CartsState {}

class CartsSuccessUpdateQuantityState extends CartsState {}

class CartsErrorUpdateQuantityState extends CartsState {}

class CartsProductIncreaseQuantityState extends CartsState {}

class CartsProductDecreaseQuantityState extends CartsState {}

class CartsRemoveProductSuccessState extends CartsState {}

class CartsRemoveProductErrorState extends CartsState {}

class CartsEnabledButtonState extends CartsState {}

class CartsNotEnabledButtonState extends CartsState {}

class RadioListChangedState extends CartsState {}

class PlaceOrderSuccessState extends CartsState {}

class PlaceOrderErrorState extends CartsState {}

class PlaceOrderLoadingState extends CartsState {}
