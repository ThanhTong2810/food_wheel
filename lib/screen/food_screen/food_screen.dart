import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_wheel/res/images/images.dart';
import 'package:food_wheel/theme/dimens.dart';
import 'package:food_wheel/utils/utils.dart';
import 'package:food_wheel/widget/animate_menu.dart';
import 'package:food_wheel/widget/app_text.dart';
import 'package:shimmer/shimmer.dart';

final Screen myFoodScreen = Screen(
    title: 'Food',
    contentBuilder: (BuildContext context) {
      return FoodScreen();
    });

class FoodScreen extends StatefulWidget {
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        color: Colors.blue,
                        child: SizedBox(
                          height: getScreenHeight(context) / 7,
                          width:getScreenHeight(context) / 7,
                          child: CachedNetworkImage(
                            width: getScreenWidth(context),
                            fit: BoxFit.fitWidth,
                            imageUrl: Images.logo,
                            imageBuilder: (context, imageProvider) => CircleAvatar(
                              backgroundImage: imageProvider,
                            ),
                            placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[400],
                                highlightColor: Colors.white,
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                )),
                            errorWidget: (context, url, error) => Icon(Icons.person),
                          ),
                        ),
                      ),
                      Dimens.width20,
                      Expanded(
                        child: Container(
                          height: getScreenHeight(context) / 7,
                          color: Colors.blue,
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                                AppText(
                                  text: 'NAME',
                                  textSize: Dimens.paragraphHeaderTextSize,
                                ),
                              Dimens.height10,
                              AppText(
                                text: 'ADDRESS',
                                textSize: Dimens.paragraphTextSize,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
