import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/injection/injection.export.dart' as di;
import '../features/features.export.dart';


MultiBlocProvider listOfBlocProviders({Widget? child}) {
  return MultiBlocProvider(
    providers:[
     BlocProvider<MoviesBloc>(create: (context)=> di.sl<MoviesBloc>(),),


    ],
    child: child!,
  );
}









