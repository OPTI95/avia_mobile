import 'package:effective_mobile/features/home/data/datasources/home_local_data_source.dart';
import 'package:effective_mobile/features/home/data/datasources/home_remote_data_source.dart';
import 'package:effective_mobile/features/home/data/repositories/home_repository_impl.dart';
import 'package:effective_mobile/features/home/domain/repositories/home_repository.dart';
import 'package:effective_mobile/features/home/domain/usecases/get_list_music_events.dart';
import 'package:effective_mobile/features/home/domain/usecases/get_save_text_from.dart';
import 'package:effective_mobile/features/home/domain/usecases/save_text_from.dart';
import 'package:effective_mobile/features/home/presentation/cubit/to_text_cubit.dart';
import 'package:effective_mobile/features/search/data/datasources/search_remote_data_source.dart';
import 'package:effective_mobile/features/search/data/repositories/search_repository_impl.dart';
import 'package:effective_mobile/features/search/domain/repositories/search_repository.dart';
import 'package:effective_mobile/features/search/domain/usecases/get_list_search_tickets.dart';
import 'package:effective_mobile/features/search/presentation/cubit/search_cubit.dart';
import 'package:effective_mobile/features/ticket/domain/repositories/ticket_repository.dart';
import 'package:effective_mobile/features/ticket/domain/usecases/get_list_tickets.dart';
import 'package:effective_mobile/features/ticket/presentation/cubit/ticket_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/home/presentation/cubit/from_text_cubit.dart';
import 'features/home/presentation/cubit/music_events_cubit.dart';
import 'features/search/presentation/cubit/texts_cubit.dart';
import 'features/ticket/data/datasources/ticket_remote_data_sourse.dart';
import 'features/ticket/data/repositories/ticket_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // Data sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(client: sl<http.Client>()),
  );
  sl.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceImpl(client: sl<http.Client>()),
  );
  sl.registerLazySingleton<TicketRemoteDataSourse>(
    () => TicketRemoteDataSourseImpl(client: sl<http.Client>()),
  );

  // Repository
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      localDataSource: sl<HomeLocalDataSource>(),
      networkInfo: sl<NetworkInfo>(),
      remoteDataSource: sl<HomeRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(
      networkInfo: sl<NetworkInfo>(),
      remoteDataSource: sl<SearchRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<TicketRepository>(
    () => TicketRepositoryImpl(
      networkInfo: sl<NetworkInfo>(),
      ticketRemoteDataSourse: sl<TicketRemoteDataSourse>(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(
    () => GetListMusicEvents(homeRepository: sl<HomeRepository>()),
  );
  sl.registerLazySingleton(
    () => SaveTextFrom(homeRepository: sl<HomeRepository>()),
  );
  sl.registerLazySingleton(
    () => GetSaveTextFrom(homeRepository: sl<HomeRepository>()),
  );
  sl.registerLazySingleton(
    () => GetListSearchTickets(searchRepository: sl<SearchRepository>()),
  );
  sl.registerLazySingleton(
    () => GetListTickets(ticketRepository: sl<TicketRepository>()),
  );

  // Bloc
  sl.registerFactory(
    () => MusicEventsCubit(
      getListMusicEvents: sl<GetListMusicEvents>(),
    ),
  );
  sl.registerFactory(
    () => FromTextCubit(
      saveTextFrom: sl<SaveTextFrom>(),
      getSaveTextFrom: sl<GetSaveTextFrom>(),
    ),
  );
  sl.registerFactory(
    () => ToTextCubit(),
  );
  sl.registerFactory(
    () => TextsCubit(),
  );
  sl.registerFactory(
    () => SearchCubit(sl<GetListSearchTickets>()),
  );
  sl.registerFactory(
    () => TicketCubit(sl<GetListTickets>()),
  );
}

void initFeatures() {}
