import 'package:flutter/material.dart';
import 'package:netflix_clone/home_page.dart';
import 'package:netflix_clone/models/api..dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/models/movie_result_model.dart';

class DetailPage extends StatefulWidget {
  String movieId;
  DetailPage({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  MovieModel movieModel = MovieModel();
  Results movieResult = Results();
  String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieDetailApiCall();
  }

  void movieDetailApiCall() async {
    Moviedisplay moviedisplay = Moviedisplay();
    await moviedisplay.MovieDetail(widget.movieId);
    movieModel = moviedisplay.movieModel;
    movieResult = Results(
        adult: movieModel.adult,
        backdropPath: movieModel.backdropPath,
        id: movieModel.id,
        posterPath: movieModel.posterPath,
        originalTitle: movieModel.originalTitle,
        overview: movieModel.overview,
        popularity: movieModel.popularity,
        releaseDate: movieModel.releaseDate,
        voteAverage: movieModel.voteAverage);
    setState(() {});
    // print(movieModel.backdrop_path);
    print(movieModel.spokenLanguages![0]["english_name"]);
  }

  @override
  Widget build(BuildContext context) {
    movieModel.backdropPath != null
        ? print("------------->" + movieModel.originalTitle!)
        : print("error");
    print(widget.movieId);
    return movieModel.id == null
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: Color.fromARGB(255, 26, 25, 25),
            body: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 400,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(baseImageUrl +
                                      movieModel.backdropPath!))),
                        ),
                        Positioned(
                            left: 10,
                            top: 30,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                size: 30,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )),
                        Positioned(
                            bottom: 40,
                            left: 10,
                            child: Text(
                              movieModel.originalTitle!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            )),
                        Positioned(
                            bottom: 20,
                            left: 13,
                            child: movieModel.tagline != null
                                ? Text(
                                    movieModel.tagline!,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text("")),
                        Positioned(
                            right: 10,
                            bottom: -25,
                            child: InkWell(
                              onTap: () {
                                bool isAdded = idList.contains(widget.movieId);
                                if (isAdded) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(movieResult
                                                  .originalTitle! +
                                              " is already added to your list")));
                                } else {
                                  idList.add(movieResult.id.toString());
                                  myList.add(movieResult);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              movieResult.originalTitle! +
                                                  " added to your list")));
                                }
                              },
                              child: Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: Colors.red),
                                  child: Icon(
                                    Icons.add,
                                    size: 30,
                                    color: Colors.white,
                                  )),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "Overview :",
                      style: TextStyle(color: Colors.amber, fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 60,
                    height: 3,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      maxLines: 4,
                      movieModel.overview!,
                      style: TextStyle(
                          color: Color.fromARGB(255, 184, 183, 183),
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text("Release Date",
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 15)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(movieModel.releaseDate!,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: 2,
                        height: 20,
                        color: Colors.white,
                      ),
                      Column(
                        children: [
                          Text("Rating",
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 15)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              movieModel.voteAverage!.toStringAsFixed(1) +
                                  "/10",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: 2,
                        height: 20,
                        color: Colors.white,
                      ),
                      Column(
                        children: [
                          Text("Language",
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 15)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            movieModel.spokenLanguages![0]["english_name"],
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Watch now",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
