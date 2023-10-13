import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'classes/counter_cubit.dart';

class CubitDemo extends StatelessWidget {
  const CubitDemo();

  @override
  Widget build(BuildContext context) {
    debugPrint("build call...");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit Demo"),
        centerTitle: true,
      ),
       body: BlocBuilder<CounterCubit, int>(
        builder: (BuildContext context, state) {
         /* return Center(
            child: Text(
              '$state',
              style: TextStyle(fontSize: 20.0),
            ),
          );*/
          debugPrint("bloc builder call...");
          return ListView.builder(
            shrinkWrap: true,
            itemCount: context.read<CounterCubit>().state,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text("List Item Count    ${(index + 1).toString()}"),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
