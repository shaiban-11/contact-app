import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_2/bloc/contact_bloc.dart';
import 'package:provider_2/contact_repository.dart';
import 'package:provider_2/contact_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ContactRepository repository = ContactRepository();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactBloc(repository),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ContactScreen(),
      ),
    );
  }
}
