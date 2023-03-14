import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skills_task/core/core.export.dart';

import '../../../features.export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Results> moviesList=[];
  List<CategoriesMoviesModel> categoriesMoviesList=[];
  final scrollController =ScrollController();
  int page = 1;
  bool hasMore =true;

  @override
  void initState() {
    super.initState();
    getCategoriesMovies();
    getMovies();
    scrollController.addListener(() {
      if(scrollController.position.maxScrollExtent == scrollController.position.pixels){
        loadMoreChats();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff080F18),
      appBar: AppBar(
        backgroundColor: const Color(0xff080F18),

      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0,),
            BlocBuilder<MoviesBloc, MoviesState>(
              buildWhen: (previous, current) {
                if (current.status.isSuccess) {
                  if(current.categoriesMoviesList.isNotEmpty){
                  categoriesMoviesList = current.categoriesMoviesList;
                  }
                }
                return current.status.isSuccess;
              },
              builder: (context, state) {
                return categoriesMoviesList.isNotEmpty
                    ?SizedBox(
                  height: 50.0,
                  child: CustomScrollView(
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return  Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Text(
                                        categoriesMoviesList
                                            .first.genres![index].name
                                            .toString(),
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white,fontWeight: FontWeight.w700),
                                      ),
                                    ),
                            );
                          },
                          childCount: categoriesMoviesList.first.genres!.length,
                        ),
                      ),
                    ],
                  ),
                )
                    :const SizedBox();
              },
            ),
            BlocBuilder<MoviesBloc, MoviesState>(
              buildWhen: (previous, current) {
                if (current.status.isSuccess) {
                  if(current.moviesList.isNotEmpty){
                  moviesList.addAll(current.moviesList.first.results!);

                  }
                }
                return current.status.isSuccess;
              },
              builder: (context, state) {
                return moviesList.isNotEmpty
                    ? Expanded(
                      child: CustomScrollView(
                        controller: scrollController,
                        physics: const ScrollPhysics(),
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    if (index < moviesList.length) {
                                      return InkWell(
                                        onTap: ()=>getMoviesDetails(moviesList[index].id!),
                                        child: Container(
                                          height: 200.0,
                                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                                          margin:const EdgeInsets.symmetric(horizontal: 8.0) ,
                                          child: Row(
                                            children: [
                                              Image.network(NetworkLinks.getPosterURL+moviesList[index].posterPath.toString()),
                                              const SizedBox(width: 8.0,),
                                            Expanded(
                                              child: Text(
                                                moviesList[index].originalTitle.toString(),
                                                style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white,fontWeight: FontWeight.w700),
                                                softWrap: true,
                                              ),
                                            ),
                                          ],
                                          ),
                                        ),
                                      );
                                    }
                                    else{
                                      return hasMore
                                          ? const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 20.0),
                                        child: Center(child: CircularProgressIndicator()),
                                      )
                                          :const Center(child: Padding(
                                        padding: EdgeInsets.symmetric(vertical: 26.0),
                                        child: Text('No more data to load'),
                                      ),);
                                    }
                                    },
                              childCount: moviesList.length+1,
                            ),
                          ),
                        ],
                      ),
                    )
                    :const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }

  void getMovies() {
    MoviesBloc.get(context).add(GetMoviesEvent(page: 1));
  }
  void getCategoriesMovies() {
    MoviesBloc.get(context).add(GetCategoriesMoviesEvent());
  }
  void loadMoreChats(){
    if(hasMore){
      page++;
      MoviesBloc.get(context).add(GetMoviesEvent(page: page));
    }
  }
  void getMoviesDetails(int id){
    openNewPage(context,  MoviesDetailsScreen(id:id));
  }


}
