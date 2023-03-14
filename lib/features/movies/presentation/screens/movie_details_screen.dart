import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skills_task/core/core.export.dart';
import 'package:flutter_skills_task/features/features.export.dart';

class MoviesDetailsScreen extends StatefulWidget {
  final int id;
  const MoviesDetailsScreen({required this.id, Key? key}) : super(key: key);

  @override
  State<MoviesDetailsScreen> createState() => _MoviesDetailsScreenState();
}

class _MoviesDetailsScreenState extends State<MoviesDetailsScreen> {
  int id = 0;
  List<MoviesDetailsModel> moviesDetailsModelList=[];
  List<TrailerResults> trailerMoviesList=[];
  MoviesDetailsModel? moviesDetailsModel;
  @override
  void initState() {
    super.initState();
    id = widget.id;
    getMovieDetails(id);
    getMovieTrailer(id);


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff080F18),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        buildWhen: (previous, current) {
          if (current.status.isSuccess) {
            if(current.moviesDetailsModelList.isNotEmpty){
            moviesDetailsModel =current.moviesDetailsModelList.first;
            }
            if(current.trailerMoviesModelList.isNotEmpty){
            trailerMoviesList=current.trailerMoviesModelList.first.results!;
            }
          }
          return current.status.isSuccess;
        },
        builder: (context, state) {
          return moviesDetailsModel != null
              ? LayoutBuilderWidget(
                child: SizedBox(
                width: double.infinity,
                  child: Column(
                    children: [
                      Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Image.network(
                                NetworkLinks.getPosterURL +moviesDetailsModel!.backdropPath.toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30.0),
                              child: Column(
                                children: [
                                  Text(
                                    moviesDetailsModel!.originalTitle.toString(),
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white,fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 20.0,),
                                  Text(
                                    moviesDetailsModel!.overview.toString(),
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white,fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 20.0,),
                                  moviesDetailsModel!.belongsToCollection != null?
                                  Text(
                                    moviesDetailsModel!.belongsToCollection!.name.toString(),
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white,fontWeight: FontWeight.normal),
                                  ):const SizedBox(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 25.0,),
                      SizedBox(
                        height: 450.0,
                        child: CustomScrollView(
                          physics: const ScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          slivers: [
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                  return trailerMoviesList.isNotEmpty ?InkWell(
                                    onTap: ()=>playTrailerMovie(trailerMoviesList[index].key!),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            trailerMoviesList[index].name.toString(),
                                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white,fontWeight: FontWeight.w700),
                                          ),
                                          const SizedBox(height: 20.0,),
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                                child: Image.network(NetworkLinks.getPosterURL+moviesDetailsModel!.backdropPath.toString(),
                                                  fit: BoxFit.fill,

                                                ),
                                              ),
                                              const Icon(
                                                Icons.play_circle_outline_sharp,
                                                color: Colors.white,
                                                size: 40.0,
                                              ),
                                              ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ):null;
                                },
                                childCount: trailerMoviesList.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
              :const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
  void getMovieDetails(int id) {
    MoviesBloc.get(context).add(GetMoviesDetailsEvent(id: id));
  }
  void getMovieTrailer(int id) {
    MoviesBloc.get(context).add(GetMoviesTrailerEvent(id: id));
  }
  void playTrailerMovie(String key){
    openNewPage(context, TrailerScreen(videoUrl: key,));
  }



}

