import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviez/base_config.dart';
import 'package:moviez/models/cast.dart';
import 'package:moviez/models/episodes.dart';
import 'package:moviez/services/services.dart';

class DetailScreen extends StatelessWidget {
  final int id;
  final String status;
  final String showposter;
  final String name;
  final double rating;
  final String description;
  const DetailScreen(
      {Key? key,
      required this.id,
      required this.showposter,
      required this.name,
      required this.rating,
      required this.description,
      required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: secondary_color,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: size.height * 0.4 - 50,

                //image section
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(50)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(showposter),
                  ),
                ),
              ),

              //rating box
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: size.width * 0.9,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          topLeft: Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 5),
                          blurRadius: 50,
                          color: const Color(0xFF12153D).withOpacity(0.2),
                        ),
                      ]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 30,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              RichText(
                                  text: TextSpan(
                                      style: TextStyle(color: Colors.black),
                                      children: [
                                    TextSpan(
                                        text: "${rating.toString()}/",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600)),
                                    const TextSpan(text: "10\n"),
                                    const TextSpan(
                                        text: "150,212",
                                        style: TextStyle(color: Colors.grey))
                                  ]))
                            ],
                          ),

                          //rate this

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Icon(Icons.star),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Rate This",
                                style: Theme.of(context).textTheme.bodyText2,
                              )
                            ],
                          ),

                          //MetaScore

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF51CF66),
                                    borderRadius: BorderRadius.circular(2)),
                                child: Text(
                                  rating.toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Metascore",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text("63 critic reviews",
                                  style: GoogleFonts.lato()),
                            ],
                          )
                        ]),
                  ),
                ),
              ),
              const SafeArea(
                  child: BackButton(
                color: Colors.white,
              ))
            ],
          ),
          SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(name, style: Theme.of(context).textTheme.headline5),
                    const SizedBox(
                      height: 10,
                      width: 20,
                    ),
                    Text(
                      status,
                      style: const TextStyle(fontSize: 15, color: Colors.green),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Html(
                  data: description,
                  style: {
                    'p': Style(
                        color: primary_color,
                        fontSize: FontSize.large,
                        fontFamily: '${GoogleFonts.mukta()}'),
                  },
                ),
                // child: Text(
                //   description,
                //   style:  GoogleFonts.lato(textStyle:  const TextStyle(color: Colors.white ,fontSize: 18))
                // ),
              ),
            ],
          ),
          FutureBuilder(
            future: ApiServices.fetchCast(id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.none) {
                return const Center(
                  child: Text("No show available right now"),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return castBuilder(snapshot.data);
            },
          )
        ],
      ),
    );
  }
}

Widget castBuilder(dynamic data) {
  var statusCode = data[1];
  if (statusCode == 200) {
    final finalJson = json.decode(data[0]!);
    print(finalJson);

    var allCast = finalJson.map((e) => Cast.fromJson(e)).toList();
    print(allCast[0].person.name);

    return ListView.builder(
        shrinkWrap: true,
        itemCount: allCast.length,
        itemBuilder: ((context, index) => Text(
              allCast[index].person.name,
              style: TextStyle(color: Colors.white),
            )));
  } else {
    return Center(
        child: Text(
      "$statusCode",
      style: TextStyle(color: primary_color),
    ));
  }
}
