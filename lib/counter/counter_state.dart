part of 'counter_cubit.dart';

// ignore: must_be_immutable
class CounterState extends Equatable {
  int countValue;
  bool? isIncrement;

  CounterState({required this.countValue, this.isIncrement});

  @override
  List<Object?> get props => [countValue, isIncrement];
}
