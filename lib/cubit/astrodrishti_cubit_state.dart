part of 'astrodrishti_cubit_cubit.dart';

@immutable
abstract class AstrodrishtiCubitState {}

class AstrodrishtiCubitInitial extends AstrodrishtiCubitState {
  AstrodrishtiCubitInitial({required this.currentUser});
  userData currentUser;
}
