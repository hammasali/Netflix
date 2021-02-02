import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/content_model.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> contentList;

  const Previews({Key key, this.title, this.contentList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 130.0,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 8.0,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (BuildContext context, int index) {
              final Content content = contentList[index];
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 100.0,
                    width: 100.0,
                    margin: const EdgeInsets.symmetric(horizontal: 18.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(content.imageUrl),
                          fit: BoxFit.cover),
                      border: Border.all(color: content.color, width: 4.0),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: content.color, width: 4.0),
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [
                              Colors.black87,
                              Colors.black45,
                              Colors.transparent
                            ],
                            stops: [
                              0,
                              0.25,
                              1
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter)),
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Image(
                        image: AssetImage(content.titleImageUrl),
                      ))
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
