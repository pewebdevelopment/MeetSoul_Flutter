import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyNetworkImage extends StatelessWidget {
  final String url;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final BoxFit? fit;
  final Color loadingColor;

  const MyNetworkImage(
      {Key? key, required this.url, this.loadingWidget, this.errorWidget, this.fit, this.loadingColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (isImageUrl) ? Image.network(
      url,
      fit: fit ?? BoxFit.cover,
      height: double.maxFinite,
      width: double.maxFinite,
      loadingBuilder: (c, Widget child, ImageChunkEvent? loadingProgress) {
        // print("loadingProgress: ${loadingProgress.toString()}");
        if (loadingProgress == null) {
          return child;
        }

        return Center(
          child: SizedBox(
            width: 32,
            height: 32,
            child: loadingWidget ??
                (Platform.isIOS
                    ? CupertinoActivityIndicator(radius: 20, color: loadingColor,)
                    : CircularProgressIndicator(
                        strokeWidth: 2,
                        color: loadingColor,
                      )),
          ),
        );
      },
      errorBuilder: (context, value, _) {
        return _errorWidget;
      },
    ) : _errorWidget;
  }

  Widget get _errorWidget => errorWidget ??
      Center(
        child: SizedBox(
          width: 32,
          height: 32,
          child: const Icon(
            Icons.report_gmailerrorred_outlined,
            color: Colors.red,
            size: 32,
          ),
        ),
      );

  bool get isImageUrl =>
      (url.isNotEmpty) &&
      (url.toLowerCase().contains('.jpg') ||
          url.toLowerCase().contains('.jpeg') ||
          url.toLowerCase().contains('.png'));
}
