import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

var popularMovies;
var trendingMovies;
var topRated;

class _MainPageState extends State<MainPage> {
  String popularMovieUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=3e04f10540e1a09b1e0052f09bd9adfb&language=en-US&page=1";
  String trendingMovieUrl =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=3e04f10540e1a09b1e0052f09bd9adfb";
  String topRatedUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=3e04f10540e1a09b1e0052f09bd9adfb&language=en-US&page=1";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiCall();
  }

  Future apiCall() async {
    http.Response response1 = await http.get(Uri.parse(popularMovieUrl));
    http.Response response2 = await http.get(Uri.parse(trendingMovieUrl));
    http.Response response3 = await http.get(Uri.parse(topRatedUrl));

    if (response1.statusCode == 200) {
      setState(() {});
      var data = response1.body;
      print(data);
      popularMovies = json.decode(data);
    }
    if (response2.statusCode == 200) {
      setState(() {});
      var data = response2.body;
      print(data);
      trendingMovies = json.decode(data);
    }
    if (response3.statusCode == 200) {
      setState(() {});
      var data = response3.body;
      print(data);
      topRated = json.decode(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Image.asset(
                    "assets/logo.png",
                    // width: 125,
                    // height: 61,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit_outlined,
                        color: Colors.white,
                      ))
                ],
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                child: Text("Who’s Watching?",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 18)),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ProfileContainer(
                    profileName: "Janki",
                    profileImage: "assets/prof1.png",
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  ProfileContainer(
                    profileName: "Shreya",
                    profileImage: "assets/prof2.png",
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ProfileContainer(
                    profileName: "Aishu",
                    profileImage: "assets/prof3.png",
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  ProfileContainer(
                    profileName: "Abhi",
                    profileImage: "assets/prof4.png",
                  )
                ],
              ),
              SizedBox(height: 30),
              Container(
                child: ProfileContainer(
                    profileName: "Roshani", profileImage: "assets/prof5.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileContainer extends StatelessWidget {
  final String profileName;
  final String profileImage;
  const ProfileContainer({
    Key? key,
    required this.profileName,
    required this.profileImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(
                image: profileImage,
                popularMovies: popularMovies,
                topRated: topRated,
                trendingMovies: trendingMovies,
              ))),
      child: Container(
        child: Column(
          children: [
            Container(
              width: 125,
              height: 125,
              child: Image.asset(
                profileImage,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(profileName,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 18)),
            )
          ],
        ),
      ),
    );
  }
}
