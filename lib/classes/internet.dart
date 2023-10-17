import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cubit_demo/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Internet extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> connectivitySubscription;

  Internet() : super(InternetInitialState()) {
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        emit(InternetLostState());
      } else {
        emit(InternetGainedState());
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription.cancel();
    return super.close();
  }
}
