import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_application/freatures/freatures_intro/repositories/splash_repository.dart';

part 'splash_state.dart';
part 'connection_status.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashRepository splashRepository = SplashRepository();
  SplashCubit()
      : super(
          SplashState(
            connectionStatus: ConnectionInitial(),
          ),
        );

  void checkConnectionEvent() async {
    emit(state.copyWith(newConnectionStatus: ConnectionInitial()));

    bool isConnect = await splashRepository.checkConnectivity();

    if (isConnect == true) {
      emit(state.copyWith(newConnectionStatus: ConnectionOn()));
    } else if (isConnect == false) {
      emit(state.copyWith(newConnectionStatus: ConnectionOff()));
    }
  }
}
