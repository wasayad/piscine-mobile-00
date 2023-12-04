

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _expression = "0";
  String _result = "0";
  void _addExpression(String c) {
    setState(() {
      //maxsize for append
      if (c == "AC") {
        _expression = "0";
      }
      else if (c == "C") {
        if (_expression.isNotEmpty) {
          _expression = _expression.substring(0, _expression.length - 1);
        }
        if (_expression.isEmpty) {
          _expression = "0";
        }
      }
      else if (_expression == "0")
      {
        _expression = "";
        _expression = _expression + c;
      }
      else {
        _expression = _expression + c;
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(left: 1.0),
                child: Text(
                  _expression,
                  style: const TextStyle(
                      fontFamily: 'sans-serif',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      color: Colors.red),
                ),

              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(left: 1.0),
                child: Text(
                  _result,
                  style: const TextStyle(
                      fontFamily: 'sans-serif',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      color: Colors.red),
                ),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Row(
                mainAxisSize: MainAxisSize.values.first,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Expanded(child: TextButton(onPressed : () => _addExpression("7"),  child:const Text("7", style: TextStyle(fontSize:  20)))),
                      Expanded(child: TextButton(onPressed:() => _addExpression("4"),  child:const Text("4", style: TextStyle(fontSize:  20)))),
                      Expanded(child: TextButton(onPressed:() => _addExpression("1"),  child:const Text("1", style: TextStyle(fontSize:  20)))),
                      Expanded(child: TextButton(onPressed:() => _addExpression("0"),  child:const Text("0", style: TextStyle(fontSize:  20)))),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Expanded(child: TextButton(onPressed:() => _addExpression("8"),  child:const Text("8", style: TextStyle(fontSize: 20)))),
                      Expanded(child: TextButton(onPressed:() => _addExpression("5"),  child:const Text("5", style: TextStyle(fontSize: 20)))),
                      Expanded(child: TextButton(onPressed:() => _addExpression("2"),  child:const Text("2", style: TextStyle(fontSize: 20)))),
                      Expanded(child: TextButton(onPressed:() => _addExpression("."),  child:const Text(".", style: TextStyle(fontSize: 20)))),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Expanded(child: TextButton(onPressed:() => _addExpression("9"),  child:const Text("9", style: TextStyle(fontSize: 20)))),
                      Expanded(child: TextButton(onPressed:() => _addExpression("6"),  child:const Text("6", style: TextStyle(fontSize: 20)))),
                      Expanded(child: TextButton(onPressed:() => _addExpression("3"),  child:const Text("3", style: TextStyle(fontSize: 20)))),
                      Expanded(child: TextButton(onPressed:() => _addExpression("00"),  child:const Text("00", style: TextStyle(fontSize: 20)))),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Expanded(child: TextButton(onPressed:() => _addExpression("C"),  child:const Text("C", style: TextStyle(fontSize:  20, color: Colors.red)))),
                      Expanded(child: TextButton(onPressed:() => _addExpression("+"),  child:const Text("+", style: TextStyle(fontSize:  20)))),
                      Expanded(child: TextButton(onPressed:() => _addExpression("x"),  child:const Text("x", style: TextStyle(fontSize: 20)))),
                      Expanded(child: TextButton(onPressed:() => _addExpression("="),  child:const Text("=", style: TextStyle(fontSize:  20, color: Colors.grey)))),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Expanded(child: TextButton(onPressed:() => _addExpression("AC"),  child:const Text("AC", style: TextStyle(fontSize:  20, color: Colors.red)))),
                      Expanded(child: TextButton(onPressed:() => _addExpression("-"),  child:const Text("-", style: TextStyle(fontSize:  20)))),
                      Expanded(child: TextButton(onPressed:() => _addExpression("/"),  child:const Text("/", style: TextStyle(fontSize: 20)))),
                      Expanded(child: TextButton(onPressed:() => {},  child:const Text("", style: TextStyle(fontSize:  20, color: Colors.grey)))),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
