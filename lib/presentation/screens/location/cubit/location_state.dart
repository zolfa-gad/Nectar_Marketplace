
abstract class LocationState {}

class LocationInitialState extends LocationState {}

class LocationLoadingState extends LocationState {}

class LocationSuccessState extends LocationState {}

class LocationErrorState extends LocationState {}

class LocationCountryLoadingState extends LocationState {}

class LocationCountrySuccessState extends LocationState {
  // final CountryModel countryModel;

  // LocationCountrySuccessState(this.countryModel);
}

class LocationCountryErrorState extends LocationState {}

class LocationCityLoadingState extends LocationState {}

class LocationCitySuccessState extends LocationState {}

class LocationCityErrorState extends LocationState {}

class LocationRegionLoadingState extends LocationState {}

class LocationRegionSuccessState extends LocationState {}

class LocationRegionErrorState extends LocationState {}

class LocationSetNewCountryState extends LocationState {}

class LocationSetNewCityState extends LocationState {}

class LocationSetNewRegionState extends LocationState {}

class LocationClearAllDataState extends LocationState {}

class LocationAddressLoadingState extends LocationState {}

class LocationAddressSuccessState extends LocationState {}

class LocationAddressErrorState extends LocationState {}
