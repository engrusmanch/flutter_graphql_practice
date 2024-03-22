import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graphql_api_integration_practice/data/remote_data_source.dart';
import 'package:graphql_api_integration_practice/data/repo_impl.dart';
import 'package:graphql_api_integration_practice/domain/repositories/repo.dart';
import 'package:graphql_api_integration_practice/network_info.dart';
import 'package:graphql_api_integration_practice/presentation/controller/controller.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

initCore() {
  Get.lazyPut<NetworkInfo>(
      () => NetworkInfoImpl(Get.find<InternetConnectionChecker>()));

  Get.lazyPut<Dio>(() => Dio());

  Get.lazyPut<InternetConnectionChecker>(() => InternetConnectionChecker());
}
initGraphQLApi(){
  // Repo Impl
  Get.lazyPut<GraphQLApiRepo>(() => GraphQLApiRepoImpl(
      remoteDataSource: Get.find(),
      networkInfo: Get.find()));

  // Data sources
  Get.lazyPut<GraphQLApiRemoteSource>(() => GraphQLApiRemoteSourceImpl(Get.find()));
  Get.lazyPut<GraphQLController>(
          () => GraphQLController(repo: Get.find()),
      fenix: true);
}