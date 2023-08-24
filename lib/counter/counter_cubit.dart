import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(countValue: 0));

  void countIncrement() {
    emit(CounterState(countValue: state.countValue + 1, isIncrement: true));
  }

  void countDecrement() {
    emit(CounterState(countValue: state.countValue - 1, isIncrement: false));
  }
}
