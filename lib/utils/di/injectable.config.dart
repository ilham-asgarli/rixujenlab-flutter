// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i5;

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i6;
import 'package:logger/logger.dart' as _i8;
import 'package:shared_preferences/shared_preferences.dart' as _i18;

import '../../data/datasources/security/local/security.local.datasource.dart'
    as _i12;
import '../../data/datasources/security/remote/security_remote_data_source.dart'
    as _i15;
import '../../data/repositories/security/local/security.local.repository.impl.dart'
    as _i14;
import '../../data/repositories/security/remote/security.remote.repository.impl.dart'
    as _i17;
import '../../domain/repositories/security/local/security.local.repository.dart'
    as _i13;
import '../../domain/repositories/security/remote/security.remote.repository.dart'
    as _i16;
import '../../domain/usecases/security/get_user_use_case.dart' as _i24;
import '../../presentation/features/main/view-models/main_view_model.dart'
    as _i9;
import '../../presentation/features/my-app/state/bloc/network/network_bloc.dart'
    as _i11;
import '../../presentation/features/my-app/state/cubit/theme/theme_cubit.dart'
    as _i19;
import '../../presentation/features/my-app/view-models/my_app_view_model.dart'
    as _i10;
import '../../presentation/utils/config/theme/exapmle_theme.dart' as _i22;
import '../../presentation/utils/config/theme/main_theme.dart' as _i23;
import '../../presentation/utils/config/theme/theme_interface.dart' as _i21;
import '../../presentation/utils/helpers/theme/theme_helper.dart' as _i20;
import '../../presentation/utils/l10n/gen/app_localizations.dart' as _i3;
import '../../presentation/utils/managers/isar_manager.dart' as _i7;
import 'isar_register_module.dart' as _i27;
import 'path_provider_register_module.dart' as _i26;
import 'register_module.dart' as _i25;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    final pathProviderRegisterModule = _$PathProviderRegisterModule();
    final isarRegisterModule = _$IsarRegisterModule();
    gh.lazySingleton<_i3.AppLocalizations>(() => registerModule.l10n);
    gh.lazySingleton<_i4.Dio>(() => registerModule.dio);
    await gh.lazySingletonAsync<_i5.Directory>(
      () => pathProviderRegisterModule.applicationDocumentsDirectory,
      instanceName: 'applicationDocuments',
      preResolve: true,
    );
    gh.lazySingletonAsync<_i5.Directory>(
      () => pathProviderRegisterModule.temporaryDirectory,
      instanceName: 'temporary',
    );
    gh.lazySingletonAsync<_i5.Directory>(
      () => pathProviderRegisterModule.applicationCacheDirectory,
      instanceName: 'applicationCache',
    );
    gh.lazySingletonAsync<_i5.Directory>(
      () => pathProviderRegisterModule.applicationSupportDirectory,
      instanceName: 'applicationSupport',
    );
    gh.lazySingleton<_i6.Isar>(
      () => isarRegisterModule.users,
      instanceName: 'users',
    );
    gh.lazySingleton<_i7.IsarManager>(() => _i7.IsarManager(
        applicationDocumentsDirectory:
            gh<_i5.Directory>(instanceName: 'applicationDocuments')));
    gh.lazySingleton<_i8.Logger>(() => registerModule.logger);
    gh.lazySingleton<_i9.MainViewModel>(() => _i9.MainViewModel());
    gh.lazySingleton<_i10.MyAppViewModel>(() => _i10.MyAppViewModel());
    gh.lazySingleton<_i11.NetworkBloc>(
      () => _i11.NetworkBloc(),
      dispose: (i) => i.close(),
    );
    gh.lazySingleton<_i12.SecurityLocalDataSource>(() =>
        _i12.SecurityLocalDataSource(
            isar: gh<_i6.Isar>(instanceName: 'users')));
    gh.lazySingleton<_i13.SecurityLocalRepository>(() =>
        _i14.SecurityLocalRepositoryImpl(
            securityLocalDataSource: gh<_i12.SecurityLocalDataSource>()));
    gh.lazySingleton<_i15.SecurityRemoteDataSource>(
        () => _i15.SecurityRemoteDataSource(gh<_i4.Dio>()));
    gh.lazySingleton<_i16.SecurityRemoteRepository>(() =>
        _i17.SecurityRemoteRepositoryImpl(
            securityRemoteDataSource: gh<_i15.SecurityRemoteDataSource>()));
    await gh.lazySingletonAsync<_i18.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i19.ThemeCubit>(
      () => _i19.ThemeCubit(),
      dispose: (i) => i.close(),
    );
    gh.singleton<_i20.ThemeHelper>(_i20.ThemeHelper());
    gh.lazySingleton<_i21.ThemeInterface>(
      () => _i22.ExampleTheme(),
      instanceName: 'ExampleTheme',
    );
    gh.lazySingleton<_i21.ThemeInterface>(
      () => _i23.MainTheme(),
      instanceName: 'MainTheme',
    );
    gh.lazySingleton<_i24.GetUserUseCase>(() => _i24.GetUserUseCase(
          securityRemoteRepository: gh<_i16.SecurityRemoteRepository>(),
          securityLocalRepository: gh<_i13.SecurityLocalRepository>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i25.RegisterModule {}

class _$PathProviderRegisterModule extends _i26.PathProviderRegisterModule {}

class _$IsarRegisterModule extends _i27.IsarRegisterModule {}
