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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '206017'),
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
  final List<String> _clothes = [];

  void _addClothes(String value) {
    setState(() {
      _clothes.add(value);
    });
  }

  void _editClothes(int index, String value) {
    setState(() {
      _clothes[index] = value;
    });
  }

  void _deleteClothes(int index) {
    setState(() {
      _clothes.removeAt(index);
    });
  }

  void openDeleteDialog(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[200],
            title: const Text(
              'Дали сте сигурни?',
              style: TextStyle(color: Colors.blue),
            ),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    _deleteClothes(index);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Да',
                    style: TextStyle(color: Colors.red),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Не',
                    style: TextStyle(color: Colors.red),
                  )),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        });
  }

  void openAddOrEditClothesDialog(int? index) {
    String? oldC = index != null ? _clothes[index] : null;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String newC = "";
          return oldC != null
              ? AlertDialog(
                  backgroundColor: Colors.grey[200],
                  title: const Text(
                    'Промени облека',
                    style: TextStyle(color: Colors.blue),
                  ),
                  content: TextFormField(
                    cursorColor: Colors.blue,
                    initialValue: oldC,
                    onChanged: (value) {
                      newC = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          if (newC.isNotEmpty) {
                            _editClothes(index!, newC);
                          }
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Промени',
                          style: TextStyle(color: Colors.red),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Откажи',
                          style: TextStyle(color: Colors.red),
                        )),
                  ],
                  actionsAlignment: MainAxisAlignment.center,
                )
              : AlertDialog(
                  backgroundColor: Colors.grey[200],
                  title: const Text(
                    'Додади облека',
                    style: TextStyle(color: Colors.blue),
                  ),
                  content: TextFormField(
                    cursorColor: Colors.blue,
                    initialValue: oldC,
                    onChanged: (value) {
                      newC = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          if (newC.isNotEmpty) {
                            _addClothes(newC);
                          }
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Додади',
                          style: TextStyle(color: Colors.red),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Откажи',
                          style: TextStyle(color: Colors.red),
                        )),
                  ],
                  actionsAlignment: MainAxisAlignment.center,
                );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 28,
            color: Colors.blue,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              'Изберете облека:',
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _clothes.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey[400],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        children: <Widget>[
                          Text(
                            _clothes[index],
                            style: const TextStyle(
                                fontSize: 24, color: Colors.blue),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          TextButton(
                            onPressed: () {
                              openAddOrEditClothesDialog(index);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  Colors.green, // Set the background color here
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.red,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                          ),
                          TextButton(
                            onPressed: () {
                              openDeleteDialog(index);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  Colors.green, // Set the background color here
                            ),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          openAddOrEditClothesDialog(null);
        },
        tooltip: 'Додади облека',
        child: const Icon(
          Icons.add,
          color: Colors.red,
        ),
      ),
    );
  }
}
