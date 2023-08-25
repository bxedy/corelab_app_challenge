import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final IHomeController controller = Modular.get();

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      body: Center(),
    ),
  );
}
