import 'dart:math';

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
      title: 'Assgn3',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 98, 131, 172)),
        // useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Email'),
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
  TextEditingController myController = new TextEditingController();
  TextEditingController myController1 = new TextEditingController();

  TextEditingController myController2 = new TextEditingController();

  TextEditingController myController3 = new TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('WELCOME!'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Enter the details below:',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: false,
                controller: myController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: myController1,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: myController2,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Roll No.',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: myController3,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsPage(
                            name: (myController.text),
                            email: (myController1.text),
                            roll: (myController2.text),
                            PhNo: (myController3.text))),
                  );
                },
                child: Text('Show Details'),
                style: OutlinedButton.styleFrom(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailsPage extends StatefulWidget {
  const DetailsPage(
      {super.key,
      required this.name,
      required this.email,
      required this.roll,
      required this.PhNo});

  final String name;
  final String email;
  final String roll;
  final String PhNo;

  @override
  State<DetailsPage> createState() => DetailsState();
}

class DetailsState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Name:${widget.name}',
            style: const TextStyle(
                fontSize: 30, color: Color.fromARGB(255, 16, 152, 173)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Email:${widget.email}',
            style: const TextStyle(
                fontSize: 30, color: Color.fromARGB(255, 16, 152, 173)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Roll No.:${widget.roll}',
            style: const TextStyle(
                fontSize: 30, color: Color.fromARGB(255, 16, 152, 173)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Phone Number:${widget.PhNo}',
            style: const TextStyle(
                fontSize: 30, color: Color.fromARGB(255, 16, 152, 173)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: OutlinedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(title: 'WELCOME!')),
                (route) => false,
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Message"),
                    content: Text("User '${widget.name}' Logged out."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Go back'),
            style: OutlinedButton.styleFrom(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              foregroundColor: Colors.black,
              backgroundColor: Colors.blue,
            ),
          ),
        )
      ]),
    ));
  }
}
