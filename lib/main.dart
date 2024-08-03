/// The main entry point for the Flutter application.
///
/// This file contains the `main` function which is the entry point for the Flutter application.
/// It imports the necessary packages and runs the `MyApp` widget.
///
/// The `MyApp` widget is the root of the application and is responsible for setting up the
/// application's theme and defining the home page.
///
/// The `MyHomePage` widget is a stateful widget that represents the home page of the application.
/// It contains a list of passwords and a text field for adding new passwords.
/// The passwords are displayed in a `ListView` with each password represented by a `ListTile`.
/// The background color of each `ListTile` is determined based on the length of the password.
///
/// The `_addPassword` method is called when the user taps the floating action button to add a new password.
/// It adds the entered password to the list of passwords and clears the text field.
///
/// The `_aesterisk` method takes a password as input and returns a string with the same length as the password,
/// but with all characters replaced by asterisks.
///
/// The `_backgroundColor` method takes a password as input and returns a color based on the length of the password.
/// Passwords with length 0 have a black background, passwords with length 1-4 have a red background,
/// passwords with length 5-7 have a yellow background, and passwords with length 8 or more have a green background.
///
/// The `build` method is responsible for building the UI of the home page.
/// It returns a `Scaffold` widget that contains an app bar, a text field, a `ListView` of passwords,
/// and a floating action button for adding passwords.
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mis contraseñas',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 129, 99, 16)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mis contraseñas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _passwords = [];
  TextEditingController _textEditingController = TextEditingController();

  void _addPassword() {
    setState(() {
      _passwords.insert(0, _textEditingController.text);
      _textEditingController.clear();
    });
  }

  String _aesterisk(String password) {
    String result = '';
    for (var i = 0; i < password.length; i++) {
      result += '*';
    }
    return result;
  }

  Color _backgroundColor(String password) {
    switch (password.length) {
      case 0:
        return Colors.black;
      case 1:
      case 2:
      case 3:
      case 4:
        return Colors.red;
      case 5:
      case 6:
      case 7:
        return Colors.yellow;
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                    hintText: 'Introduce una contraseña...'),
              )),
          Expanded(
            child: ListView.builder(
              itemCount: _passwords.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_aesterisk(_passwords[index])),
                tileColor: _backgroundColor(_passwords[index]),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPassword,
        tooltip: 'Añadir',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
