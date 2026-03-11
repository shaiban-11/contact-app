import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_2/poda.dart';
import 'package:provider_2/theme_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeSettings(),

      builder: (context, asyncSnapshot) {
        final settings = context.read<ThemeSettings>();
        return MaterialApp(
          title: 'Flutter Demo',
          theme: settings.currentTheme,
          home: Shaiban(title: "shaiban"),
        );
      },
    );
  }
}
