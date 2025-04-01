import 'package:collecto_data/collecto_data.dart';
import 'package:collecto_repos/collecto_repos.dart';
import 'package:collecto_store/app/view/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({required this.apiClient, super.key});

  final Dio apiClient;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ProductRepository>(
      create: (_) => ProductRepository(
        productApi: ProductApiManager(apiClient),
      ),
      child: const AppView(),
    );
  }
}
