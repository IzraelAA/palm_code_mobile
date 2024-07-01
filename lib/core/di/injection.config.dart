// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:palm_code_mobile/feature/book/data/data_sources/book_data_source.dart'
    as _i3;
import 'package:palm_code_mobile/feature/book/data/repositories/book_repository.dart'
    as _i5;
import 'package:palm_code_mobile/feature/book/domain/repositories/book_repository.dart'
    as _i4;
import 'package:palm_code_mobile/feature/book/domain/use_cases/get_book.dart'
    as _i6;
import 'package:palm_code_mobile/feature/book/presentation/manager/book_bloc.dart'
    as _i7;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.ApiService>(() => _i3.ApiService());
  gh.lazySingleton<_i4.BookRepository>(
      () => _i5.BookRepositoryImpl(gh<_i3.ApiService>()));
  gh.factory<_i6.GetBooks>(() => _i6.GetBooks(gh<_i4.BookRepository>()));
  gh.lazySingleton<_i7.BookCubit>(() => _i7.BookCubit(gh<_i6.GetBooks>()));
  return getIt;
}
