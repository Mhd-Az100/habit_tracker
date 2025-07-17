// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:habit_tracker/core/dependency_injection/datasource_module.dart'
    as _i3;
import 'package:habit_tracker/core/dependency_injection/hive_module.dart'
    as _i271;
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
    as _i790;
import 'package:habit_tracker/features/habit/domain/usecases/complete_habit_usecase.dart'
    as _i199;
import 'package:habit_tracker/features/habit/domain/usecases/delete_habit_usecase.dart'
    as _i1011;
import 'package:habit_tracker/features/habit/domain/usecases/get_all_habits_usecase.dart'
    as _i681;
import 'package:habit_tracker/features/habit/domain/usecases/get_habit_by_id_usecase.dart'
    as _i515;
import 'package:habit_tracker/features/habit/domain/usecases/get_habit_stats_usecase.dart'
    as _i168;
import 'package:habit_tracker/features/habit/domain/usecases/update_habit_usecase.dart'
    as _i89;
import 'package:habit_tracker/features/habit/presentation/controller/habit_bloc.dart'
    as _i232;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;

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
    await gh.singletonAsync<_i979.Box<_i830.HabitModel>>(
      () => hiveModule.habitBox,
      preResolve: true,
    );
    await gh.singletonAsync<_i979.Box<_i513.HabitCompletionModel>>(
      () => hiveModule.habitCompletionBox,
      preResolve: true,
    );
    gh.lazySingleton<_i880.HabitLocalDataSource>(
        () => dataSourceModule.habitLocalDataSource(
              gh<_i979.Box<_i830.HabitModel>>(),
              gh<_i979.Box<_i513.HabitCompletionModel>>(),
            ));
    gh.lazySingleton<_i446.HabitRepository>(
        () => _i856.HabitRepositoryImpl(gh<_i880.HabitLocalDataSource>()));
    gh.lazySingleton<_i199.CompleteHabitUseCase>(
        () => _i199.CompleteHabitUseCase(gh<_i446.HabitRepository>()));
    gh.lazySingleton<_i168.GetHabitStatsUseCase>(
        () => _i168.GetHabitStatsUseCase(gh<_i446.HabitRepository>()));
    gh.lazySingleton<_i681.GetAllHabitsUseCase>(
        () => _i681.GetAllHabitsUseCase(gh<_i446.HabitRepository>()));
    gh.lazySingleton<_i515.GetHabitByIdUseCase>(
        () => _i515.GetHabitByIdUseCase(gh<_i446.HabitRepository>()));
    gh.lazySingleton<_i1011.DeleteHabitUseCase>(
        () => _i1011.DeleteHabitUseCase(gh<_i446.HabitRepository>()));
    gh.lazySingleton<_i89.UpdateHabitUseCase>(
        () => _i89.UpdateHabitUseCase(gh<_i446.HabitRepository>()));
    gh.lazySingleton<_i790.AddHabitUseCase>(
        () => _i790.AddHabitUseCase(gh<_i446.HabitRepository>()));
    gh.factory<_i232.HabitBloc>(() => _i232.HabitBloc(
          getAllHabits: gh<_i681.GetAllHabitsUseCase>(),
          addHabit: gh<_i790.AddHabitUseCase>(),
          updateHabit: gh<_i89.UpdateHabitUseCase>(),
          deleteHabit: gh<_i1011.DeleteHabitUseCase>(),
          getHabitById: gh<_i515.GetHabitByIdUseCase>(),
          completeHabit: gh<_i199.CompleteHabitUseCase>(),
        ));
    return this;
  }
}

class _$HiveModule extends _i271.HiveModule {}

class _$DataSourceModule extends _i3.DataSourceModule {}
