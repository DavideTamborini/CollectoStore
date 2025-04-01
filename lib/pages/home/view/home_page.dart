import 'package:collecto_repos/collecto_repos.dart';
import 'package:collecto_store/pages/home/bloc/home_bloc.dart';
import 'package:collecto_store/pages/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => HomeBloc(
          productRepository: RepositoryProvider.of<ProductRepository>(context),
        )..add(FetchProducts()),
        child: const HomeView(),
      ),
    );
  }
}
