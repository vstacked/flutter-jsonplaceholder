import 'package:flutter/material.dart';
import 'package:majoo_pretest/ui/home/widgets/items.dart';
import 'package:majoo_pretest/ui/home/widgets/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: const <Widget>[SearchField(), Items()]),
        ),
      ),
    );
  }
}
