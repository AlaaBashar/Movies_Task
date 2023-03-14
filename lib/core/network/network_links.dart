class NetworkLinks{
static const String getPopularMovies = 'movie/popular';
static const String getCategoriesMovies = 'genre/movie/list';
static const String apiKey = '52160f52a3ee7f6ad3cfc2359e327db9';
static const String getPosterURL = 'https://image.tmdb.org/t/p/w220_and_h330_face';

static const String getTrailerVideoURL = 'https://www.youtube.com/watch?v=';


static String getVideoDetails(int id){
  String videoDetails = 'movie/$id';
  return videoDetails;
}
static String getMovieTrailer(int id){
  String trailerVideo = 'movie/$id/videos';
  return trailerVideo;
}




}