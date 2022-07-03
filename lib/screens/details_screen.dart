import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final int id;
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
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Image.network(
                  showposter,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                  top: 260,
                  left: 20,
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "$rating",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      )
                    ],
                  ))
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
