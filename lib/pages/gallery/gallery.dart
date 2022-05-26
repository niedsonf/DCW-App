import 'package:flutter/material.dart';
import 'package:getmage/constants/controllers.dart';
import 'package:getmage/constants/style.dart';
import 'package:getmage/controllers/menu_controller.dart';
import 'package:getmage/pages/gallery/widgets/custom_sliver_appbar.dart';
import 'package:getmage/pages/gallery/widgets/custom_sliver_child.dart';
import 'package:getmage/services/user.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: UserServices.getAllFavorites(id: authController.userModel.id),
        builder: (context, AsyncSnapshot<List> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Container(
                margin: EdgeInsets.only(top: 30),
                child: CustomScrollView(
                  slivers: [
                    CustomSliverAppbar(
                        text: DogMenuItem, numbers: snapshot.data![0].length),
                    CustomSliverChild(urlList: snapshot.data![0]),
                    CustomSliverAppbar(
                        text: CatMenuItem, numbers: snapshot.data![1].length),
                    CustomSliverChild(urlList: snapshot.data![1]),
                    CustomSliverAppbar(
                        text: WaifuMenuItem, numbers: snapshot.data![2].length),
                    CustomSliverChild(urlList: snapshot.data![2]),
                  ],
                ),
              );
            default:
              return CircularProgressIndicator(color: lightRed);
          }
        });
  }
}
