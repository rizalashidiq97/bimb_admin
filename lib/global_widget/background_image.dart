import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/images/undip.jpg'),
      fit: BoxFit.cover,
      color: Theme.of(context).primaryColor.withOpacity(0.9),
      colorBlendMode: BlendMode.srcOver,
    );
  }
}
