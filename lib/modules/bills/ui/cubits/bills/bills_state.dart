part of 'bills_cubit.dart';

abstract class BillsState extends Equatable {}

final class BillsInitial extends BillsState {
  @override
  List<Object?> get props => [];
}

final class BillsLoading extends BillsState {
  @override
  List<Object?> get props => [];
}

final class BillsLoaded extends BillsState {
  final List<BillModel> bills;

  BillsLoaded(this.bills);

  @override
  List<Object?> get props => [bills];
}

final class BillsError extends BillsState {
  final String title;
  final String message;

  BillsError(this.title, this.message);

  @override
  List<Object?> get props => [title, message];
}
