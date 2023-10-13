import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'classes/counter_cubit.dart';
import 'cubit_demo.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const MaterialApp(
        title: "Cubit Demo",
        home: CubitDemo(),
      ),
    );
  }
}
