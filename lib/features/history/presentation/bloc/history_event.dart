import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class HistoryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// initial event
class AuthorInitialEvent extends HistoryEvent {}

// add event
class AuthorAddEvent extends HistoryEvent {
  final String name, type;

  AuthorAddEvent({required this.name, required this.type});
}
