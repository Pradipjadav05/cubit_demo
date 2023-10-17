import 'package:cubit_demo/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'classes/internet.dart';

class InternetCubits extends StatelessWidget {
  const InternetCubits();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Internet Cubits"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocProvider(
          create: (_) => Internet(),
          child: BlocConsumer<Internet, InternetState>(
            builder: (context, state) {
              if (state is InternetInitialState) {
                return Text("Loading...!!");
              } else if (state is InternetGainedState) {
                return Text("Connected...!!");
              } else {
                return Text("Disconnected...!!");
              }
            },
            listener: (context, state) {
              final snackBar = SnackBar(
                content: Text(state is InternetGainedState
                    ? "Connected...!!"
                    : "Disconnected...!!"),
                shape: StadiumBorder(),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ),
      ),
    );
  }
}
