// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:habit_tracker/core/dependency_injection/cubit_module.dart'
    as _i353;
import 'package:habit_tracker/core/dependency_injection/datasource_module.dart'
    as _i3;
import 'package:habit_tracker/core/dependency_injection/hive_module.dart'
    as _i271;
import 'package:habit_tracker/core/theme/theme_cubit.dart' as _i258;
import 'package:habit_tracker/features/habit/data/datasources/habit_local_datasource.dart'
    as _i880;
import 'package:habit_tracker/features/habit/data/models/habit_completion_model.dart'
    as _i513;
import 'package:habit_tracker/features/habit/data/models/habit_model.dart'
    as _i830;
import 'package:habit_tracker/features/habit/data/repositories/habit_repository_impl.dart'
    as _i856;
import 'package:habit_tracker/features/habit/domain/repositories/habit_repository.dart'
    as _i446;
import 'package:habit_tracker/features/habit/domain/usecases/add_habit_usecase.dart'
    as _i1035;
import 'package:habit_tracker/features/habit/domain/usecases/complete_habit_usecase.dart'
    as _i941;
import 'package:habit_tracker/features/habit/domain/usecases/delete_habit_usecase.dart'
    as _i292;
import 'package:habit_tracker/features/habit/domain/usecases/get_all_habits_usecase.dart'
    as _i142;
import 'package:habit_tracker/features/habit/domain/usecases/get_habit_by_id_usecase.dart'
    as _i808;
import 'package:habit_tracker/features/habit/domain/usecases/get_habit_stats_usecase.dart'
    as _i134;
import 'package:habit_tracker/features/habit/domain/usecases/update_habit_usecase.dart'
    as _i263;
import 'package:habit_tracker/features/habit/presentation/controller/bloc/habit_bloc.dart'
    as _i127;
import 'package:habit_tracker/features/habit/presentation/controller/cubit/add_habit_cubit.dart'
    as _i940;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;
import 'package:uuid/uuid.dart' as _i706;

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
    final hiveModule = _$HiveModule();
    final dataSourceModule = _$DataSourceModule();
    final cubitModule = _$CubitModule();
    await gh.singletonAsync<_i979.Box<_i830.HabitModel>>(
      () => hiveModule.habitBox,
      preResolve: true,
    );
    await gh.singletonAsync<_i979.Box<_i513.HabitCompletionModel>>(
      () => hiveModule.habitCompletionBox,
      preResolve: true,
    );
    await gh.singletonAsync<_i979.Box<dynamic>>(
      () => hiveModule.themeBox,
      preResolve: true,
    );
    gh.lazySingleton<_i706.Uuid>(() => dataSourceModule.uuid);
    gh.factory<_i940.AddHabitCubit>(
        () => _i940.AddHabitCubit(gh<_i706.Uuid>()));
    gh.lazySingleton<_i258.ThemeCubit>(
        () => cubitModule.themeCubit(gh<_i979.Box<dynamic>>()));
    gh.lazySingleton<_i880.HabitLocalDataSource>(
        () => dataSourceModule.habitLocalDataSource(
              gh<_i979.Box<_i830.HabitModel>>(),
              gh<_i979.Box<_i513.HabitCompletionModel>>(),
            ));
    gh.lazySingleton<_i446.HabitRepository>(
        () => _i856.HabitRepositoryImpl(gh<_i880.HabitLocalDataSource>()));
    gh.lazySingleton<_i941.CompleteHabitUseCase>(
        () => _i941.CompleteHabitUseCase(gh<_i446.HabitRepository>()));
    gh.lazySingleton<_i134.GetHabitStatsUseCase>(
        () => _i134.GetHabitStatsUseCase(gh<_i446.HabitRepository>()));
    gh.lazySingleton<_i263.UpdateHabitUseCase>(
        () => _i263.UpdateHabitUseCase(gh<_i446.HabitRepository>()));
    gh.lazySingleton<_i1035.AddHabitUseCase>(
        () => _i1035.AddHabitUseCase(gh<_i446.HabitRepository>()));
    gh.lazySingleton<_i808.GetHabitByIdUseCase>(
        () => _i808.GetHabitByIdUseCase(gh<_i446.HabitRepository>()));
    gh.lazySingleton<_i292.DeleteHabitUseCase>(
        () => _i292.DeleteHabitUseCase(gh<_i446.HabitRepository>()));
    gh.lazySingleton<_i142.GetAllHabitsUseCase>(
        () => _i142.GetAllHabitsUseCase(gh<_i446.HabitRepository>()));
    gh.factory<_i127.HabitBloc>(() => _i127.HabitBloc(
          getAllHabits: gh<_i142.GetAllHabitsUseCase>(),
          addHabit: gh<_i1035.AddHabitUseCase>(),
          updateHabit: gh<_i263.UpdateHabitUseCase>(),
          deleteHabit: gh<_i292.DeleteHabitUseCase>(),
          getHabitById: gh<_i808.GetHabitByIdUseCase>(),
          completeHabit: gh<_i941.CompleteHabitUseCase>(),
          getHabitStats: gh<_i134.GetHabitStatsUseCase>(),
        ));
    return this;
  }
}

class _$HiveModule extends _i271.HiveModule {}

class _$DataSourceModule extends _i3.DataSourceModule {}

class _$CubitModule extends _i353.CubitModule {}
