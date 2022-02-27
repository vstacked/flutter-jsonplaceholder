import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majoo_pretest/core/bloc/api_bloc.dart';
import 'package:majoo_pretest/core/repositories/api_repository.dart';
import 'package:majoo_pretest/ui/home/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ApiRepository(),
      child: BlocProvider(
        create: (context) => ApiBloc(context.read<ApiRepository>())..add(ApiPosts()),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: HomePage(),
        ),
      ),
    );
  }
}
