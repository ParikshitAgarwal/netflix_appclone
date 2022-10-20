import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/detail_page.dart';
import 'package:netflix_clone/main_page.dart';
import 'package:netflix_clone/models/api..dart';
import 'package:netflix_clone/models/movie_result_model.dart';
import 'package:expandable_search_bar/expandable_search_bar.dart';
import 'package:netflix_clone/mylist_screen.dart';
import 'package:netflix_clone/search_screen.dart';

class HomePage extends StatefulWidget {
  final String image;
  // List<Results> popularMovies;
  // var trendingMovies;
  // var topRated;
  HomePage({
    Key? key,
    required this.image,
    // required this.popularMovies,
    // required this.trendingMovies,
    // required this.topRated,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Results> myList = [];
List<String> idList = [];

class _HomePageState extends State<HomePage> {
  String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  List<Results> trendingMovieList = [];
  List<Results> popularMovieList = [];
  List<Results> topRatedMovieList = [];
  bool onSearchTap = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiCall();
  }

  void apiCall() async {
    //trending movies
    Moviedisplay trendingMovieDisplay = Moviedisplay();
    await trendingMovieDisplay.movieList("trending/movie/day");
    trendingMovieList = trendingMovieDisplay.result;

    //popular movies
    Moviedisplay popularMovieDisplay = Moviedisplay();
    await popularMovieDisplay.movieList("movie/popular");
    popularMovieList = popularMovieDisplay.result;

    //top rated movies
    Moviedisplay topRatedMovieDisplay = Moviedisplay();
    await topRatedMovieDisplay.movieList("movie/top_rated");
    topRatedMovieList = topRatedMovieDisplay.result;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int randomIndex = Random().nextInt(10);

    List images = [
      "assets/pic1.png",
      "assets/pic2.png",
      "assets/pic3.png",
      "assets/pic4.png",
      "assets/pic5.png"
    ];
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 26, 25, 25),
          // backgroundColor: Colors.black,
          elevation: 0,
          actions: [
            Container(
                margin: EdgeInsets.only(top: 20),
                child: IconButton(
                  onPressed: () {
                    onSearchTap = !onSearchTap;
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                )),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
              width: 30,
              height: 30,
              child: Image.asset(widget.image),
            )
          ],
          leading: Container(
              margin: EdgeInsets.only(top: 20),
              child: Image.asset("assets/logo1.png"))),
      // backgroundColor: Colors.black,
      backgroundColor: Color.fromARGB(255, 26, 25, 25),
      body: SingleChildScrollView(
        child:
            onSearchTap ? SearchScreen() : homePageScreen(context, randomIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Color(0xff7B7676),
          selectedItemColor: Colors.white,
          backgroundColor: Color(0xff121212),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_collection_outlined),
                label: "Coming Soon"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.download,
                ),
                label: "Downloads")
          ]),
    );
  }

  Container homePageScreen(BuildContext context, int randomIndex) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {},
                child: Text("TV Shows",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Movies",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => MyListScreen(
                            image: widget.image,
                          ))));
                },
                child: Text("My List",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
          trendingMovieList.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Stack(
                  children: [
                    Center(
                      child: Container(
                          width: 210,
                          height: 310,
                          child: Image.network(
                            baseImageUrl +
                                trendingMovieList[randomIndex].posterPath!,
                          )
                          // Image.asset(
                          //   "assets/pic5.png",
                          //   fit: BoxFit.contain,
                          // ),
                          ),
                    ),
                    // Positioned(
                    //   left: 120,
                    //   bottom: 10,
                    //   child: Image.asset("assets/coco.png"),
                    // ),
                  ],
                ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Heartfelt  ",
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
              Icon(
                Icons.circle,
                color: Color(0xffEFA67C),
                size: 5,
              ),
              Text(
                "  Feel-Good  ",
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
              Icon(
                Icons.circle,
                color: Color(0xffEFA67C),
                size: 5,
              ),
              Text(
                "  Drama  ",
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
              Icon(
                Icons.circle,
                size: 5,
                color: Color(0xffEFA67C),
              ),
              Text(
                "  Music  ",
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
              Icon(
                Icons.circle,
                size: 5,
                color: Color(0xffEFA67C),
              ),
              Text(
                "  Spanish",
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        bool isAdded = idList.contains(
                            trendingMovieList[randomIndex].id.toString());
                        if (isAdded) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(trendingMovieList[randomIndex]
                                      .originalTitle! +
                                  " is already added to your list")));
                        } else {
                          idList.add(
                              trendingMovieList[randomIndex].id.toString());
                          myList.add(trendingMovieList[randomIndex]);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(trendingMovieList[randomIndex]
                                      .originalTitle! +
                                  " added to your list")));
                        }
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                  Text(
                    "My List",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.play_arrow,
                      ),
                      Text("Play",
                          style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.info_outline,
                        color: Colors.white,
                      )),
                  Text(
                    "Info",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Popular Movies",
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          popularMovieList.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Container(
                  margin: EdgeInsets.all(10),
                  height: 250,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => DetailPage(
                                      movieId:
                                          popularMovieList[index].id.toString(),
                                    ))));
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            width: 152,
                            child: popularMovieList[index].posterPath == null
                                ? Text("hello World")
                                : Image.network(
                                    baseImageUrl +
                                        popularMovieList[index].posterPath!,
                                    // images[index],
                                    fit: BoxFit.contain,
                                  ),
                          ),
                        );
                      })),
                ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Tredning Movies",
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          trendingMovieList.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Container(
                  margin: EdgeInsets.all(10),
                  height: 250,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => DetailPage(
                                      movieId: trendingMovieList[index]
                                          .id
                                          .toString(),
                                    ))));
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            width: 152,
                            child: Image.network(
                              baseImageUrl +
                                  trendingMovieList[index].posterPath!,
                              // images[index],
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      })),
                ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Top Rated",
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          topRatedMovieList.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Container(
                  margin: EdgeInsets.all(10),
                  height: 250,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => DetailPage(
                                      movieId: topRatedMovieList[index]
                                          .id
                                          .toString(),
                                    ))));
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            width: 152,
                            child: Image.network(
                              baseImageUrl +
                                  topRatedMovieList[index].posterPath!,
                              // images[index],
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      })),
                )
        ],
      ),
    );
  }
}
