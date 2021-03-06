import 'package:bloc_pattern/counter_bloc.dart';
import 'package:bloc_pattern/counter_event.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _counterBloc.counter,
          initialData: 0,
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _counterBloc.counterEventSink.add(DecrementEvent()),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 8),
          FloatingActionButton(
            onPressed: () => _counterBloc.counterEventSink.add(IncrementEvent()),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _counterBloc.dispose();
  }
}
