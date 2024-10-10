import 'package:capcoding_test_technique_flutter_2024/commons/enums/app_state_status.enum.dart';

class AppStateModel<T> {
  AppStateStatusEnum? status;
  T? data;
  String? message;

  AppStateModel({
    this.status,
    this.data,
    this.message,
  });

  AppStateModel.loading() : status = AppStateStatusEnum.LOADING;
  AppStateModel.loadmore(this.data) : status = AppStateStatusEnum.LOADMORE;
  AppStateModel.completed(this.data) : status = AppStateStatusEnum.COMPLETED;
  AppStateModel.error(this.message) : status = AppStateStatusEnum.ERROR;
}
