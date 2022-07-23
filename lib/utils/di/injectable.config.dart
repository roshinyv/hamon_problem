// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../bloc/classroom/classroom_bloc.dart' as _i7;
import '../../bloc/student/student_bloc.dart' as _i8;
import '../../services/classroom/class_repo.dart' as _i6;
import '../../services/classroom/class_services.dart' as _i5;
import '../../services/student/api_services.dart' as _i3;
import '../../services/student/student_repo.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.ApiServices>(() => _i4.ApiRepo());
  gh.lazySingleton<_i5.ClassServices>(() => _i6.ClassRepo());
  gh.factory<_i7.ClassroomBloc>(
      () => _i7.ClassroomBloc(get<_i5.ClassServices>()));
  gh.factory<_i8.StudentBloc>(() => _i8.StudentBloc(get<_i3.ApiServices>()));
  return get;
}
