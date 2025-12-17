part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String error;

  const HomeErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class HomeSuccessState extends HomeState {
  final List<TicketModel> res;
  final bool isOffline;

  const HomeSuccessState({required this.res, required this.isOffline});

  @override
  List<Object> get props => [res, isOffline];
}
