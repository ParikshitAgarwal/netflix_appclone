import 'package:flutter/material.dart';
import 'package:netflix_clone/models/api..dart';
import 'package:netflix_clone/models/movie_result_model.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchBarEditingController = TextEditingController();
  List<Results> searchResult = [];
  String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void searchApiCall(String query) async {
    searchResult = [];
    Moviedisplay MovieSearchDisplayModel = Moviedisplay();
    setState(() {});
    await MovieSearchDisplayModel.MovieSearch(query);
    searchResult = MovieSearchDisplayModel.result;
    print(searchResult.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.search),
                  suffixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.cancel)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              onChanged: (value) => searchApiCall(value),
            ),
          ),
          searchResult != null
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      width: 152,
                      child: searchResult[index].posterPath == null
                          ? Text("hello World")
                          : Image.network(
                              baseImageUrl + searchResult[index].posterPath!,
                              // images[index],
                              fit: BoxFit.contain,
                            ),
                    );
                  },
                  itemCount: searchResult.length,
                )
              : CircularProgressIndicator()
        ],
      ),
    );
  }
}
