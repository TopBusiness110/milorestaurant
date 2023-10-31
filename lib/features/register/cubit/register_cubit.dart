import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/models/config_model.dart';
import '../../../core/models/package_model.dart';
import '../../../core/remote/service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.api) : super(RegisterInitial()) {
    getconfig();
    getpackges() ;

    }
  PackageModel? packageModel;
  int activeSubscriptionIndex = 0;
  int businessIndex = 0;
  ServiceApi api;
  ConfigModel? configModel;
  getconfig() async {
    emit(ConfigLoading());
    final response = await api.getConfig();
    response.fold(
          (l) => emit(ConfigError()),
          (r) {
        configModel = r;

        emit(ConfigLoaded());
      },
    );
  }
  getpackges() async {
    emit(PackgesLoading());
    final response = await api.getPackges();
    response.fold(
          (l) => emit(PackgesError()),
          (r) {
            packageModel = r;

        emit(PackgesLoaded());
      },
    );
  }
  void setBusiness(int business){
    activeSubscriptionIndex = 0;
    businessIndex = business;
    emit(ConfigLoaded());
  }

}
