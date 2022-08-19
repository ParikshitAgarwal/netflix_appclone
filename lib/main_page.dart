import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

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
                    width: 60,
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
              ))),
      child: Container(
        child: Column(
          children: [
            Container(
              width: 135,
              height: 135,
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
