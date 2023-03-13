// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:equatable/equatable.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final DataConnectionChecker dataConnectionChecker;
  StreamSubscription<DataConnectionStatus>? listener;
  InternetBloc({
    required this.dataConnectionChecker,
  }) : super(InternetLoading()) {
    
    _checkInternetConnection();

    on<InternetStatusChanged>(_internetStatusChangeToState);
  }

  _checkInternetConnection() {
    listener = dataConnectionChecker.onStatusChange.listen((connectivity) {
      add(InternetStatusChanged(connectivity: connectivity));
    });
  }

  @override
  Future<void> close() {
    listener!.cancel();
    return super.close();
  }

  FutureOr<void> _internetStatusChangeToState(
      InternetStatusChanged event, Emitter<InternetState> emit) {
    if (event.connectivity == DataConnectionStatus.connected) {
      emit(InternetConnected());
    }
    if (event.connectivity == DataConnectionStatus.disconnected) {
      emit(InternetDisconnected());
    }
  }
}
