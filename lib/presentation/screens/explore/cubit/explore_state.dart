abstract class ExploreState {}

class ExploreInitialState extends ExploreState {}

// class ExploreSearchFieldChangedState extends ExploreState {}

class ExploreSearchResultSuccessState extends ExploreState {}

class ExploreSearchResultErrorState extends ExploreState {}

class ExploreSearchResultLoadingState extends ExploreState {}

class ExploreIsNotFirstSearchState extends ExploreState {}

class ExploreIsFirstSearchState extends ExploreState {}

class ExploreIsEmptySearchState extends ExploreState {}

class ExploreIsNotEmptySearchState extends ExploreState {}
