// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:home1/core/di/register_module.dart' as _i716;
import 'package:home1/data/remote/api/news_data_source.dart' as _i883;
import 'package:home1/data/remote/impl/news_data_source_impl.dart' as _i985;
import 'package:home1/data/repo_impl/news_repository_impl.dart' as _i550;
import 'package:home1/domain/repo/news_repository.dart' as _i846;
import 'package:home1/ui/bloc/news_bloc.dart' as _i328;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i883.NewsDataSource>(
      () => _i985.NewsDataSourceImpl(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i846.NewsRepository>(
      () => _i550.NewsRepositoryImpl(dataSource: gh<_i883.NewsDataSource>()),
    );
    gh.factory<_i328.NewsBloc>(
      () => _i328.NewsBloc(repository: gh<_i846.NewsRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i716.RegisterModule {}
