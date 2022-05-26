import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:getmage/constants/controllers.dart';
import 'package:getmage/helpers/request_helper.dart';

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: requestImage(menuController.activeItem.value),
      builder: (context, snapshot) {
        String url = snapshot.data.toString();
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          case ConnectionState.done:
            return Dismissible(
                key: GlobalKey(),
                behavior: HitTestBehavior.translucent,
                crossAxisEndOffset: 1,
                onDismissed: (direction) {
                  imageController.changeImage(url);
                },
                child: Image.network(
                  url,
                  fit: BoxFit.contain,
                ));
        }
      },
    );
  }
}
