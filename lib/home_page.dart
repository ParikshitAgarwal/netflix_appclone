import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'package:netflix_clone/mylist_screen.dart';

class HomePage extends StatefulWidget {
  final String image;
  var popularMovies;
  var trendingMovies;
  var topRated;
  HomePage({
    Key? key,
    required this.image,
    required this.popularMovies,
    required this.trendingMovies,
    required this.topRated,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String baseImageUrl = "https://image.tmdb.org/t/p/w500";

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
              child: Icon(
                Icons.search,
                size: 30,
              ),
            ),
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
        child: Container(
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
              widget.trendingMovies == null
                  ? Center(child: CircularProgressIndicator())
                  : Stack(
                      children: [
                        Center(
                          child: Container(
                              width: 210,
                              height: 310,
                              child: Image.network(baseImageUrl +
                                  widget.trendingMovies["results"][randomIndex]
                                      ["poster_path"])
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
                          onPressed: () {},
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
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 16),
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
              widget.popularMovies == null
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      margin: EdgeInsets.all(10),
                      height: 250,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: ((context, index) {
                            return Container(
                              margin: EdgeInsets.all(10),
                              width: 152,
                              child: Image.network(
                                baseImageUrl +
                                    widget.popularMovies["results"][index]
                                        ["poster_path"],
                                // images[index],
                                fit: BoxFit.contain,
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
              widget.trendingMovies == null
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      margin: EdgeInsets.all(10),
                      height: 250,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: ((context, index) {
                            return Container(
                              margin: EdgeInsets.all(10),
                              width: 152,
                              child: Image.network(
                                baseImageUrl +
                                    widget.trendingMovies["results"][index]
                                        ["poster_path"],
                                // images[index],
                                fit: BoxFit.contain,
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
              widget.topRated == null
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      margin: EdgeInsets.all(10),
                      height: 250,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: ((context, index) {
                            return Container(
                              margin: EdgeInsets.all(10),
                              width: 152,
                              child: Image.network(
                                baseImageUrl +
                                    widget.topRated["results"][index]
                                        ["poster_path"],
                                // images[index],
                                fit: BoxFit.contain,
                              ),
                            );
                          })),
                    )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Color(0xff7B7676),
          selectedItemColor: Colors.white,
          backgroundColor: Color(0xff121212),
          items: [
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
}
