// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'internet_bloc.dart';

abstract class InternetEvent extends Equatable {
  const InternetEvent();

  @override
  List<Object> get props => [];
}

class InternetStatusChanged extends InternetEvent {
  final DataConnectionStatus connectivity;
  const InternetStatusChanged({
    required this.connectivity,
  });

  @override
  List<Object> get props => [connectivity];
}
