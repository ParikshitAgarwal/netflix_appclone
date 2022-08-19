import 'package:flutter/material.dart';

class MyListScreen extends StatelessWidget {
  final String image;

  const MyListScreen({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List images = [
      "assets/pic1.png",
      "assets/pic2.png",
      "assets/pic3.png",
      "assets/pic4.png",
      "assets/pic5.png",
      "assets/pic5.png",
      "assets/pic4.png",
      "assets/pic3.png",
      "assets/pic2.png",
      "assets/pic1.png",
      "assets/pic2.png",
      "assets/pic3.png",
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
              child: Image.asset("assets/logo1.png")),
          title: Container(
              margin: EdgeInsets.only(top: 20), child: Text("My List")),
          centerTitle: true,
        ),
        backgroundColor: Color.fromARGB(255, 26, 25, 25),
        body: Container(
          margin: EdgeInsets.only(top: 20, left: 10, right: 10),
          child: GridView.builder(
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  mainAxisExtent: 180),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  width: 252,
                  height: 200,
                  child: Image.asset(images[index], fit: BoxFit.contain),
                );
              }),
        ));
  }
}
