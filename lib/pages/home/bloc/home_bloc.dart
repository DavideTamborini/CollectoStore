import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:collection/collection.dart';
import 'package:collecto_data/collecto_data.dart';
import 'package:collecto_repos/collecto_repos.dart';
import 'package:collecto_store/common/common.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(const HomeState()) {
    on<FetchProducts>(_onFetchProducts, transformer: sequential());
  }

  final ProductRepository _productRepository;

  Future<void> _onFetchProducts(
    FetchProducts event,
    Emitter<HomeState> emit,
  ) async {
    if (state.hasReachedMax) return;

    final apiRequest = await _productRepository.getItems(
      pageNumber: (state.products.length / 20).ceil(),
      pageSize: 20,
    );

    apiRequest.fold(
      (data) => emit(
        state.copyWith(
          apiStatus: ApiStatus.success,
          products: [...state.products, ...data],
        ),
      ),
      (failure) => emit(
        state.copyWith(
          apiStatus: ApiStatus.values
                  .firstWhereOrNull((i) => i.code == failure.statusCode) ??
              ApiStatus.failure,
        ),
      ),
    );
  }
}
