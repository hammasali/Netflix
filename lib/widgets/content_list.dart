import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/content_model.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool originals;

  const ContentList(
      {Key key, this.title, this.contentList, this.originals = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          height: originals ? 500.0 : 220.0,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            itemCount: contentList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final Content content = contentList[index];
              return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  height: originals ? 400.0 : 200.0,
                  width: originals ? 200.0 : 130.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(content.imageUrl), fit: BoxFit.cover),
                  ));
            },
          ),
        )
      ]),
    );
  }
}
