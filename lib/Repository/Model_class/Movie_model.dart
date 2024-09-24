
class Moviemodel {
  List<Movies>? movies;
  int? page;

  Moviemodel({this.movies, this.page});

  Moviemodel.fromJson(Map<String, dynamic> json) {
    movies = json["movies"] == null ? null : (json["movies"] as List).map((e) => Movies.fromJson(e)).toList();
    page = json["page"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(movies != null) {
      _data["movies"] = movies?.map((e) => e.toJson()).toList();
    }
    _data["page"] = page;
    return _data;
  }
}

class Movies {
  int? id;
  String? backdropPath;
  List<String>? genres;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  String? contentType;

  Movies({this.id, this.backdropPath, this.genres, this.originalTitle, this.overview, this.posterPath, this.releaseDate, this.title, this.contentType});

  Movies.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    backdropPath = json["backdrop_path"];
    genres = json["genres"] == null ? null : List<String>.from(json["genres"]);
    originalTitle = json["original_title"];
    overview = json["overview"];
    posterPath = json["poster_path"];
    releaseDate = json["release_date"];
    title = json["title"];
    contentType = json["contentType"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["backdrop_path"] = backdropPath;
    if(genres != null) {
      _data["genres"] = genres;
    }
    _data["original_title"] = originalTitle;
    _data["overview"] = overview;
    _data["poster_path"] = posterPath;
    _data["release_date"] = releaseDate;
    _data["title"] = title;
    _data["contentType"] = contentType;
    return _data;
  }
}