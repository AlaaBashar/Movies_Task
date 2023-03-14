class TrailerMoviesModel {
  int? id;
  List<TrailerResults>? results;

  TrailerMoviesModel({this.id, this.results});

  TrailerMoviesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      results = <TrailerResults>[];
      json['results'].forEach((v) {
        results!.add(TrailerResults.fromJson(v));
      });
    }
  }


}

class TrailerResults {
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? publishedAt;
  String? id;

  TrailerResults(
      {this.iso6391,
        this.iso31661,
        this.name,
        this.key,
        this.site,
        this.size,
        this.type,
        this.official,
        this.publishedAt,
        this.id});

  TrailerResults.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    publishedAt = json['published_at'];
    id = json['id'];
  }


}