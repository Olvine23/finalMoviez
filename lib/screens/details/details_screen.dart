// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviez/base_config.dart';
import 'package:moviez/constants.dart';
import 'package:moviez/models/cast.dart';
import 'package:moviez/models/cast-details.dart';
import 'package:moviez/models/show_images.dart';
import 'package:moviez/services/services.dart';

class DetailScreen extends StatelessWidget {
  final int id;
  final String premiered;
  final String status;
  final String showposter;
  final String name;
  final double rating;
  final String description;
  const DetailScreen(
      {Key? key,
      required this.premiered,
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
      body: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // backdrop 
            Container(
      // 40% of our total height
      height: size.height * 0.4,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.4 - 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image:  NetworkImage(showposter),
              ),
            ),
          ),
          // Rating Box
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              // it will cover 90% of our total width
              width: size.width * 0.9,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 50,
                    color: Color(0xFF12153D).withOpacity(0.2),
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.star ,color: Colors.yellow,),
                        SizedBox(height: kDefaultPadding / 4),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: rating.toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              TextSpan(text: "10\n"),
                              TextSpan(
                                text: "150,212",
                                style: TextStyle(color: kTextLightColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Rate this
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.star,),
                        SizedBox(height: kDefaultPadding / 4),
                        Text("Rate This",
                            style: Theme.of(context).textTheme.bodyText2),
                      ],
                    ),
                    // Metascore
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Color(0xFF51CF66),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Text(
                            rating.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: kDefaultPadding / 4),
                        const Text(
                          "Metascore",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          "62 critic reviews",
                          style: TextStyle(color: kTextLightColor),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          // Back Button
          const SafeArea(child: BackButton( color: primary_color, )),
        ],
      ),
    ),

    // end of the backdrop section

    //title and duration section


   const SizedBox(height: kDefaultPadding / 2),

   Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: kDefaultPadding / 2),
                Row(
                  children: <Widget>[
                    Text(
                      premiered,
                      style: TextStyle(color: kTextLightColor),
                    ),
                    SizedBox(width: kDefaultPadding),
                    Text(
                      "PG-13",
                      style: TextStyle(color: kTextLightColor),
                    ),
                    SizedBox(width: kDefaultPadding),
                    Text(
                      "2h 32min",
                      style: TextStyle(color: kTextLightColor),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 64,
            width: 64,
            child: FlatButton(
              onPressed: () {},
              color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.play_arrow,
                size: 28,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    ),

    //end of title
    Padding(
            padding: EdgeInsets.symmetric(
              vertical: kDefaultPadding / 2,
              horizontal: kDefaultPadding,
            ),

            child: 
            Text("Summary",
            style: Theme.of(context).textTheme.headline5,
            
            ),
            
    ),

    Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child:  Html(
              
              data: description,
              style:  {
                'p':Style(
                  color: Color(0xFF737599),
                  letterSpacing: 1,
                

    
                )
              }
              
              )
          ),


          //cast section

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Cast" , style:  Theme.of(context).textTheme.headline5 ),
              ),
              FutureBuilder(
                future: ApiServices.fetchCast(id),
                builder: (context, snapshot){

                  if(snapshot.connectionState == ConnectionState.none){

                    return Text("None at the moment");
                  }

                  if(snapshot.connectionState == ConnectionState.waiting){
                    return CircularProgressIndicator();
                  }

                  print(snapshot.data);

                  return castBuilder(snapshot.data);
                } 
                ),
                //  FutureBuilder(
                // future: ApiServices.fetchImages(id),
                // builder: (context, snapshot){

                //   if(snapshot.connectionState == ConnectionState.none){

                //     return Text("None at the moment");
                //   }

                //   if(snapshot.connectionState == ConnectionState.waiting){
                //     return CircularProgressIndicator();
                //   }

                //   print(snapshot.data);

                //   return  imageBuilder(snapshot.data);
                // } 
                // ),
            ],
          )
          ],


        ),


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

    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          
          itemCount: allCast.length,
          itemBuilder: ((context, index) => Column(
            children: [
               ProfilePicture(name: "name", radius: 31, fontsize: 30, img: allCast[index].person.image.medium,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  
                      allCast[index].person.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                        
                        ),
                    ),
              ),
            ],
          ))),
    );
  } else {
    return Center(
        child: Text(
      "$statusCode",
      style: TextStyle(color: primary_color),
    ));
  }
}


Widget imageBuilder(dynamic data){
  var statusCode = data[1];
  if(statusCode == 200){
     final finalJson = json.decode(data[0]!);
     print(finalJson);

      var allPics = finalJson.map((e) => Pics.fromJson(e)).toList();
      print(allPics[0].resolutions.medium);


      return GridView.builder(
        shrinkWrap: true,
        
        gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
          
          crossAxisCount: 2,
           mainAxisExtent: 250,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          
          

          
          ),
          itemCount: allPics.length,
        
        itemBuilder:  (BuildContext context, index){

          return Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(allPics[0].resolutions.medium))
            ),

          );

        }
        
        );
     


  }
  else{
    return Text("Error");
  }
}
