import 'package:bloc_concepts/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocConsumer<CounterCubit, CounterState>(
        // TODO: implement listener

        listener: (context, state) {
          if (state.isIncrement == true) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Increment"),
              duration: Duration(milliseconds: 1000),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Decrement"),
                duration: Duration(milliseconds: 1000)));
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .countIncrement();
                        },
                        child: const Icon(Icons.add),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Text(
                        state.countValue.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .countDecrement();
                        },
                        child: const Icon(Icons.remove),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
