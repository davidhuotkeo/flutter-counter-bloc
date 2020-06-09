import 'package:counter_bloc/src/blocs/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Counter",
        home: BlocProvider<CounterBloc>(
            create: (BuildContext context) => CounterBloc(),
            child: CounterPage()));
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, state) {
          return Center(
            child: Text("$state"),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(onPressed: () => _counterBloc.add(Increment())),
          FloatingActionButton(onPressed: () => _counterBloc.add(Decrement()))
        ],
      ),
    );
  }
}
