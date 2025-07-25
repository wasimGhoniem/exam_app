// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/api/client/auth_api_client.dart' as _i213;
import '../../features/auth/api/data_source_impl/auth_remote_data_source_impl.dart'
    as _i758;
import '../../features/auth/data/data_sources/auth_remote_data_source.dart'
    as _i25;
import '../../features/auth/data/repositories/auth_repositories_impl.dart'
    as _i394;
import '../../features/auth/domain/repositories/auth_repositories.dart'
    as _i962;
import '../../features/auth/domain/use_cases/sign_in_use_case.dart' as _i926;
import '../../features/auth/domain/use_cases/sign_up_use_case.dart' as _i179;
import '../../features/auth/presentation/cubit/view_model/sign_in_view_model.dart'
    as _i260;
import '../../features/auth/presentation/cubit/view_model/sign_up_view_model.dart'
    as _i897;
import '../providers/app_config_provider.dart' as _i56;
import 'modules/dio_module.dart' as _i983;
import 'modules/shared_prefs_module.dart' as _i913;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPrefsModule = _$SharedPrefsModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPrefsModule.provideSharedPreferences(),
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(
        () => dioModule.providePrettyLogger());
    gh.factory<_i213.AuthApiClient>(() => _i213.AuthApiClient(gh<_i361.Dio>()));
    gh.singleton<_i56.AppConfigProvider>(() => _i56.AppConfigProvider(
        sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.factory<_i25.AuthRemoteDataSource>(() => _i758.AuthRemoteDataSourceImpl(
        authApiClient: gh<_i213.AuthApiClient>()));
    gh.factory<_i962.AuthRepositories>(() => _i394.AuthRepositoriesImpl(
        authRemoteDataSource: gh<_i25.AuthRemoteDataSource>()));
    gh.factory<_i926.SignInUseCase>(() =>
        _i926.SignInUseCase(authRepositories: gh<_i962.AuthRepositories>()));
    gh.factory<_i179.SignUpUseCase>(() =>
        _i179.SignUpUseCase(authRepositories: gh<_i962.AuthRepositories>()));
    gh.factory<_i260.SignInViewModel>(() => _i260.SignInViewModel(
          signInUseCase: gh<_i926.SignInUseCase>(),
          appConfigProvider: gh<_i56.AppConfigProvider>(),
        ));
    gh.factory<_i897.SignUpViewModel>(
        () => _i897.SignUpViewModel(signUpUseCase: gh<_i179.SignUpUseCase>()));
    return this;
  }
}

class _$SharedPrefsModule extends _i913.SharedPrefsModule {}

class _$DioModule extends _i983.DioModule {}
