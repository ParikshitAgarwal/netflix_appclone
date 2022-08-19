import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/mylist_screen.dart';

class HomePage extends StatelessWidget {
  final String image;
  const HomePage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: Image.asset(image),
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
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Movies",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => MyListScreen(
                                image: image,
                              ))));
                    },
                    child: Text("My List",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  )
                ],
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      width: 210,
                      height: 310,
                      child: Image.asset(
                        "assets/pic5.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 120,
                    bottom: 10,
                    child: Image.asset("assets/coco.png"),
                  ),
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
                  "Top 10 in Thriller",
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        width: 152,
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.contain,
                        ),
                      );
                    })),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Top 10 in Adventure",
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        width: 152,
                        child:
                            Image.asset(images[4 - index], fit: BoxFit.contain),
                      );
                    })),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Top 10 in Comedy",
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        width: 152,
                        child: Image.asset(
                          images[index],
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
