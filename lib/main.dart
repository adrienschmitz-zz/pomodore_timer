import 'package:flutter/material.dart';
import 'package:pomodore_timer/home.dart';
import 'package:pomodore_timer/theme_model.dart';
import 'package:provider/provider.dart';
import 'theme.dart' as Theme;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer(builder: (context, ThemeModel themeNotifier, child) {
        return MaterialApp(
          title: 'Pomodore Timer',
          theme: themeNotifier.isDark ? Theme.darkTheme : Theme.lightTheme,
          home: HomePage(),
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
