import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moviez/models/shows.dart';
import 'package:moviez/screens/details_screen.dart';
import 'package:moviez/services/services.dart';

class SearchBody extends StatefulWidget {
  SearchBody({Key? key}) : super(key: key);

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(45.0),
            child: TextField(
              controller: searchcontroller,
            ),
          ),
          FutureBuilder(
            future: ApiServices.searchShows(searchcontroller.text),
            builder: (context, projectSnap) {
              if (projectSnap.connectionState == ConnectionState.none) {
                //print('project snapshot data is: ${projectSnap.data}');
                return const Center(
                  child: Text("No show available right now"),
                );
              }
              if (projectSnap.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }

              print(projectSnap.data);
              return moviebuilder(
                projectSnap.data,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget moviebuilder(dynamic data) {
    var statuscode = data[1];
    if (statuscode == 200) {
      final finalJson = json.decode(data[0]!);

      var allshow = finalJson.map((e) => Mod.fromJson(e)).toList();

      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: allshow.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      id: allshow[index].id,
                      showposter: allshow[index].image.original,
                      name: allshow[index].name,
                      rating: allshow[index].rating.average,
                      description: allshow[index].summary,
                    ),
                  )),
              child: SizedBox(
                height: 200,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                          width: 250,
                          height: 120,

                          // child: Image.network(
                          //   allshow[index].image.original,
                          //   fit: BoxFit.cover,
                          //   errorBuilder: (BuildContext context, Object exception,
                          //       StackTrace? stackTrace) {
                          //     if (kDebugMode) {
                          //       print("Exception >> ${exception.toString()}");
                          //     }
                          //     return Image.asset('assets/images/poster_1.jpg');
                          //   },
                          // ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              "assets/images/poster_1.jpg",
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                    Text(
                      allshow[index].name,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    } else {
      return const Center(
        child: Text("Not Found"),
      );
    }
  }
}
