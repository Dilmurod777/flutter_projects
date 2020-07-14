import 'package:flutter/material.dart';
import 'package:unsplash_gallery/screens/detailed_image/detailed_image.dart';

class SingleImage extends StatelessWidget {
  final Map<dynamic, dynamic> image;

  const SingleImage({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom:
                BorderSide(width: .5, color: Colors.black.withOpacity(0.25)),
          ),
        ),
        child: ListTile(
          title: Text(
            image['description'] != null
                ? image['description']
                : image['alt_description'],
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text(image['user']['name']),
          leading: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailedImageScreen(image: image),
                ),
              );
            },
            child: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(image['urls']['thumb']),
            ),
          ),
        ),
      ),
    );
  }
}
