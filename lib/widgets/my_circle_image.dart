import 'package:flutter/material.dart';

import 'my_network_image.dart';

class MyCircleImage extends StatelessWidget {
  final double imageSize;
  final String url;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final BoxFit? fit;

  const MyCircleImage(
      {Key? key,
      required this.imageSize,
      required this.url,
      this.loadingWidget,
      this.errorWidget, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("image url: $url");
    return ClipRRect(
      borderRadius: BorderRadius.circular(imageSize / 2),
      child: SizedBox(
        width: imageSize,
        height: imageSize,
        child: MyNetworkImage(
          url: url,
          loadingWidget: loadingWidget,
          errorWidget: errorWidget,
          fit: fit,
        ),
      ),
    );
  }
}
