import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telecom_support_app/features/home/data/models/tickets_model.dart';
import 'package:telecom_support_app/features/home/domain/usecases/home_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase homeUseCase;

  HomeCubit({required this.homeUseCase}) : super(HomeInitial());

  Future<void> activeTicketsRequest() async {
    emit(HomeLoadingState());

    final isConnected = await homeUseCase.homeRepo.networkInfo.isConnected;

    final res = await homeUseCase.call();

    res.fold(
      (failure) {
        emit(HomeErrorState(error: failure.error));
      },
      (response) {
        emit(HomeSuccessState(res: response, isOffline: !isConnected));
      },
    );
  }
}
