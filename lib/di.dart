import 'package:av_settings/data/data.dart';
import 'package:av_settings/data/data_sources/custom_interface/custom_interface.dart';
import 'package:av_settings/data/data_sources/custom_interface/custom_interface_contract.dart';
import 'package:av_settings/data/repositories_impl/custom_interface_repo_impl.dart';
import 'package:av_settings/data/repositories_impl/language_repo_impl.dart';
import 'package:av_settings/domain/domain.dart';
import 'package:get_it/get_it.dart';

/// sl = service locator
final sl = GetIt.I;

Future<void> init() async {
  sl.registerFactory<LanguageUseCase>(
      () => LanguageUseCase(languageRepository: sl()));
  sl.registerFactory<LanguageRepository>(
      () => LanguageRepositoryImpl(languageSourceContract: sl()));
  sl.registerFactory<LanguageSourceContract>(() => LanguageLocalDataSource());
  sl.registerFactory<CustomInterfaceUsecase>(
      () => CustomInterfaceUsecase(customInterfaceRepo: sl()));
  sl.registerFactory<CustomInterfaceRepo>(
      () => CustomInterfaceRepoImpl(customInterfaceContract: sl()));
  sl.registerFactory<CustomInterfaceContract>(
      () => CustomInterfaceLocalDataSource());
}
