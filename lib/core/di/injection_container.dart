import 'package:flemby/data/repositories/account_repository_impl.dart';
import 'package:flemby/data/sources/local/account_data_source.dart';
import 'package:flemby/data/sources/local/server_data_source.dart';
import 'package:flemby/domain/repositories/account_repository.dart';
import 'package:flemby/domain/usecases/server/add_server_usecase.dart';
import 'package:flemby/domain/usecases/server/get_selected_server_usecase.dart';
import 'package:flemby/domain/usecases/server/remove_server_usecase.dart';
import 'package:flemby/domain/usecases/server/save_selected_server_usecase.dart';
import 'package:flemby/domain/usecases/server/update_server_usecase.dart';
import 'package:flemby/presentation/server_selection/bloc/server_selection_bloc.dart';
import 'package:flemby/core/theme/cubit/theme_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flemby/core/network/base_url_provider.dart';
import 'package:flemby/core/network/dio_client.dart';
import 'package:flemby/core/l10n/cubit/locale_cubit.dart';
import 'package:flemby/domain/services/device_service/device_service_impl.dart';
import 'package:flemby/domain/services/device_service/device_service.dart';
import 'package:flemby/domain/repositories/server_repository.dart';
import 'package:flemby/domain/repositories/emby_server_repository.dart';
import 'package:flemby/domain/usecases/emby_server/validate_server_connection.dart';
import 'package:flemby/domain/usecases/emby_server/get_public_system_info.dart';
import 'package:flemby/data/repositories/emby_server_repository_impl.dart';
import 'package:flemby/data/repositories/server_repository_impl.dart';
import 'package:flemby/data/sources/remote/emby_server_api_service.dart';
import 'package:flemby/domain/usecases/server/get_server_list_usecase.dart';
import 'package:flemby/domain/usecases/account/add_emby_account.dart';
import 'package:flemby/domain/usecases/account/get_emby_account_list.dart';
import 'package:flemby/domain/usecases/account/get_selected_emby_account.dart';
import 'package:flemby/domain/usecases/account/remove_emby_account.dart';
import 'package:flemby/domain/usecases/account/save_selected_emby_account.dart';
import 'package:flemby/domain/usecases/account/update_emby_account.dart';
import 'package:flemby/domain/usecases/emby_server/authenticate_by_name.dart';
import 'package:flemby/presentation/account_selection/bloc/account_selection_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // External & Low-level Services
  await _initExternal();

  // Data Sources: Remote & Local
  _initDataSources();

  // Core
  _initCore();

  // Repositories
  _initRepositories();

  // UseCases
  _initUseCases();

  // Presentation/Blocs
  _initPresentation();
}

Future<void> _initExternal() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPrefs);
  getIt.registerLazySingleton(() => DeviceInfoPlugin());

  getIt.registerLazySingleton<DeviceService>(
    () => DeviceServiceImpl(getIt(), getIt()),
  );
}

void _initCore() {
  getIt.registerLazySingleton(() => LocaleCubit());

  getIt.registerLazySingleton(() => ThemeCubit());

  final serverSelectionImpl = ServerRepositoryImpl(getIt());

  getIt.registerLazySingleton<ServerRepository>(() => serverSelectionImpl);
  getIt.registerLazySingleton<BaseUrlProvider>(() => serverSelectionImpl);

  getIt.registerLazySingleton(() => DioClient(getIt(), getIt()));
}

void _initDataSources() {
  // Local sources
  getIt.registerLazySingleton<ServerLocalDataSource>(
    () => ServerLocalDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<AccountLocalDataSource>(
    () => AccountLocalDataSourceImpl(getIt()),
  );

  // Remote sources
  getIt.registerLazySingleton<EmbyServerRemoteDataSource>(
    () => EmbyServerRemoteDataSourceImpl(getIt()),
  );
}

void _initRepositories() {
  getIt.registerLazySingleton<EmbyServerRepository>(
    () => EmbyServerRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<AccountRepository>(
    () => AccountRepositoryImpl(getIt()),
  );
}

void _initUseCases() {
  getIt.registerLazySingleton(() => GetServerListUseCase(getIt()));
  getIt.registerLazySingleton(() => AddServerUseCase(getIt()));
  getIt.registerLazySingleton(() => RemoveServerUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateServerUseCase(getIt()));
  getIt.registerLazySingleton(() => SaveSelectedServerUseCase(getIt()));
  getIt.registerLazySingleton(() => GetSelectedServerUseCase(getIt()));
  getIt.registerLazySingleton(() => ValidateServerConnectionUseCase(getIt()));
  getIt.registerLazySingleton(() => GetPublicSystemInfoUsecase(getIt()));
  getIt.registerLazySingleton(() => AddEmbyAccountUseCase(getIt()));
  getIt.registerLazySingleton(() => GetEmbyAccountListUseCase(getIt()));
  getIt.registerLazySingleton(() => GetSelectedEmbyAccountUseCase(getIt()));
  getIt.registerLazySingleton(() => RemoveEmbyAccountUseCase(getIt()));
  getIt.registerLazySingleton(() => SaveSelectedEmbyAccountUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateEmbyAccountUseCase(getIt()));
  getIt.registerLazySingleton(() => AuthenticateByNameUseCase(getIt()));
}

void _initPresentation() {
  getIt.registerFactory(
    () => ServerSelectionBloc(
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    ),
  );

  getIt.registerFactory(
    () => AccountSelectionBloc(
      getPublicSystemInfoUsecase: getIt(),
      getEmbyAccountListUseCase: getIt(),
      addEmbyAccountUseCase: getIt(),
      removeEmbyAccountUseCase: getIt(),
      getSelectedEmbyAccountUseCase: getIt(),
      saveSelectedEmbyAccountUseCase: getIt(),
      authenticateByNameUseCase: getIt(),
    ),
  );
}
