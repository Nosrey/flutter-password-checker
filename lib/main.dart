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
