import 'package:discount_things_app/screen/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'database/provider.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Provider<TodoBloc>(
        create: (context) => TodoBloc(),
        child: const TodoListScreen(),
      ),
    );
  }
}
