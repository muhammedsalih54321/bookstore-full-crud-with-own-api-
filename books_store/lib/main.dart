import 'package:books_store/Bloc/Delete/bookstrore4_bloc.dart';
import 'package:books_store/Bloc/Get/bookstore2_bloc.dart';
import 'package:books_store/Bloc/Post/bookstore1_bloc.dart';
import 'package:books_store/Bloc/Put/bookstore3_bloc.dart';
import 'package:books_store/Ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Bookstore1Bloc()),
        BlocProvider(create: (context) => Bookstore2Bloc()),
        BlocProvider(create: (context) => Bookstore3Bloc()),
        BlocProvider(create: (context) => Bookstore4Bloc()),
      ],

      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()),
    );
  }
}
