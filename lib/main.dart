import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finder/pages/main_page.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    runApp(const MyApp());
  } else {
    exit(0);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<InternetConnectionStatus>(
      create: (_) {
        return InternetConnectionChecker().onStatusChange;
      },
      initialData: InternetConnectionStatus.connected,
      child: MaterialApp(
        title: 'Finder',
        debugShowCheckedModeBanner: !true,
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.dark),
        home: const Finder(),
      ),
    );
  }
}
