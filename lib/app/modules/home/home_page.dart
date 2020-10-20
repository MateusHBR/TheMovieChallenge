import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Filmes"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: true,
            snap: true,
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            expandedHeight: 230,
            flexibleSpace: ListView(
              children: [
                appBar(widget.title),
                searchFilms(size),
                listOfCategories(size),
              ],
            ),
          ),
          Observer(
            builder: (_) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var movie = controller.movieList[index];

                    return movieItem(
                      size,
                      title: movie.title,
                      genres: movie.genres,
                      image: movie.posterPath,
                    );
                  },
                  childCount: controller.movieList.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget movieItem(Size size, {String title, String genres, String image}) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 10,
        top: 6,
      ),
      height: 470,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "https://image.tmdb.org/t/p/w220_and_h330_face/$image",
          ),
        ),
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 162,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.43, 1],
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0),
                    Color.fromRGBO(0, 0, 0, 63),
                    Color.fromRGBO(0, 0, 0, 1),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 32,
            left: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 296,
                  child: Text(
                    '$title'.toUpperCase(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: 296,
                  child: Text(
                    '$genres',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listOfCategories(Size size) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(top: 16),
      width: size.width,
      child: Observer(
        builder: (_) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 21.5),
            scrollDirection: Axis.horizontal,
            itemCount: controller.genreList.length,
            separatorBuilder: (context, index) => SizedBox(width: 12),
            itemBuilder: (context, index) {
              var item = controller.genreList[index];

              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(
                    width: 1,
                    color: Color.fromRGBO(241, 243, 245, 1),
                  ),
                ),
                child: Text(
                  "${item.name}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(0, 56, 76, 1),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget searchFilms(Size size) {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 21.5),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(241, 243, 245, 1),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(100),
          ),
          prefixIcon: Icon(Icons.search),
          hintText: 'Pesquise filmes',
        ),
      ),
    );
  }

  Widget appBar(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 48, left: 21.5, bottom: 24),
      child: Text(
        '$title',
        style: TextStyle(
          fontSize: 18,
          color: Color.fromRGBO(52, 58, 64, 1),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
