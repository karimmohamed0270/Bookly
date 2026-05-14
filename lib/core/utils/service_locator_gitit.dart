import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/repos/home_reop_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Apiservice>(Apiservice(Dio()));
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(getIt.get<Apiservice>()));
  // getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(Apiservice(Dio())));
}
