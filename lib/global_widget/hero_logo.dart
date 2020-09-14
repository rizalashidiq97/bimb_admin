import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageHeroSIBIMBING extends StatelessWidget {
  final String tag;
  final double height;
  final double width;
  final String image;

  const ImageHeroSIBIMBING({
    Key key,
    @required this.tag,
    @required this.height,
    @required this.width,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Image(
        image: AssetImage(image),
        fit: BoxFit.contain,
        height: height,
        width: MediaQuery.of(context).size.width - width,
      ),
    );
  }
}
