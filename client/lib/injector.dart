import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'data/data_sources/remote/product_remote_data_source.dart';
import 'data/repositories/product_repository_impl.dart';
import 'domain/repositories/product_repository.dart';
import 'domain/use_cases/fetch_product_use_case.dart';
import 'presentation/blocs/bloc/product_bloc.dart';

/// Initialize sl as a service locator.
final sl = GetIt.instance;

/// Initialize all setup service locator.
Future<void> init() async {
  // bloc
  // registering service locator for [ProductBloc].
  sl.registerFactory(() => ProductBloc(fetchProductUseCase: sl()));

  // usecases
  // registering service locator for [FetchProductUseCase].
  sl.registerLazySingleton(() => FetchProductUseCase(productRepository: sl()));

  // repositories
  // registering service locator for [ProductRepository].
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(productRemoteDataSource: sl()));

  // datasources
  // registering service locator for [ProductRemoteDataSource].
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(dio: sl()));

  // external
  // registering service locator for [Dio()].
  sl.registerLazySingleton(() => Dio());
}
