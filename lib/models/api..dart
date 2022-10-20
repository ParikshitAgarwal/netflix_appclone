import 'dart:convert';

import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/models/movie_result_model.dart';
import 'package:http/http.dart' as http;

class Moviedisplay {
  String baseUrl = "https://api.themoviedb.org/3/";
  Moviedisplay();
  List<Results> result = [];
  late MovieModel movieModel;

  Future<void> movieList(String movieGenre) async {
    String url = baseUrl +
        "${movieGenre}?api_key=3e04f10540e1a09b1e0052f09bd9adfb&language=en-US&page=1";

    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    print("movie result -" + response.body);

    data['results'].forEach((element) {
      Results movieResults = Results(
          backdropPath: element['backdrop_path'],
          adult: element['adult'],
          // genreIds: element['genre_ids'],
          id: element['id'],
          originalLanguage: element['original_language'],
          originalTitle: element['original_title'],
          overview: element['overview'],
          popularity: element['popularity'],
          posterPath: element['poster_path'],
          releaseDate: element['release_date'],
          title: element['title'],
          video: element['video'],
          // voteAverage: element['vote_average'],
          voteCount: element['vote_count']);
      result.add(movieResults);
    });
  }

  Future<void> MovieDetail(String id) async {
    String url = baseUrl +
        "movie/${id}?api_key=3e04f10540e1a09b1e0052f09bd9adfb&language=en-US";

    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    print("movie detail - " + response.body);

    movieModel = MovieModel(
        id: data["id"],
        overview: data["overview"],
        originalLanguage: data["original_language"],
        popularity: data["popularity"],
        posterPath: data["poster_path"],
        backdropPath: data["backdrop_path"],
        originalTitle: data["original_title"],
        releaseDate: data["release_date"],
        tagline: data["tagline"],
        voteAverage: data["vote_average"],
        spokenLanguages: data["spoken_languages"]);
  }

  Future<void> MovieSearch(String query) async {
    String url = baseUrl +
        "search/movie?api_key=3e04f10540e1a09b1e0052f09bd9adfb&language=en-US&query=${query}&page=1&include_adult=false";

    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    print("movie serach list - " + response.body);

    data['results'].forEach((element) {
      Results movieSearchResults = Results(
          backdropPath: element['backdrop_path'],
          adult: element['adult'],
          // genreIds: element['genre_ids'],
          id: element['id'],
          originalLanguage: element['original_language'],
          originalTitle: element['original_title'],
          overview: element['overview'],
          popularity: element['popularity'],
          posterPath: element['poster_path'],
          releaseDate: element['release_date'],
          title: element['title'],
          video: element['video'],
          // voteAverage: element['vote_average'],
          voteCount: element['vote_count']);
      result.add(movieSearchResults);
    });
  }
}
