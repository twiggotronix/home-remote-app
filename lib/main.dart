import 'package:flutter/material.dart';
import 'package:home_remote/pages/home.dart';
import 'package:home_remote/pages/loading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
    },
  ));
}

