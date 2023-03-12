import '../../features/features.export.dart';
import '../core.export.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

class DependencyInjectionInit{
  Future<void> init()async{
    ///init Network InterFace
    final networkInterface = DioNetworkInterfaceImpl(enableLog: true);
    sl.registerLazySingleton(() => networkInterface);

    ///Register Bloc
    sl.registerFactory(() => MoviesBloc(moviesUseCases: sl()));
    ///UseCases var
    final moviesUseCase = moviesUseCases(networkInterface);
    ///Register UseCases
    sl.registerLazySingleton(() => moviesUseCase);
  }

  MoviesUseCases moviesUseCases(DioNetworkInterface dioNetworkInterfaceImpl){
    final MoviesRemoteData moviesRemoteDataImpl;
    final MoviesRepositories moviesRepositoriesImpl;
    moviesRemoteDataImpl = MoviesRemoteDataImpl(dioNetworkInterface: dioNetworkInterfaceImpl );
    moviesRepositoriesImpl = MoviesRepositoriesImpl(moviesRemoteData:moviesRemoteDataImpl);
    return MoviesUseCases(moviesRepositories:moviesRepositoriesImpl);
  }
}
