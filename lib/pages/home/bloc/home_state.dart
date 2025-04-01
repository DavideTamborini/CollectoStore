part of 'home_bloc.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.apiStatus = ApiStatus.loading,
    this.products = const [],
    this.hasReachedMax = false,
  });

  final ApiStatus apiStatus;
  final List<Product> products;
  final bool hasReachedMax;

  HomeState copyWith({
    ApiStatus? apiStatus,
    List<Product>? products,
    bool? hasReachedMax,
  }) {
    return HomeState(
      apiStatus: apiStatus ?? this.apiStatus,
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [apiStatus, products, hasReachedMax];
}
