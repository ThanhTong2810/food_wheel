import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_wheel/theme/dimens.dart';
import 'package:food_wheel/utils/utils.dart';
import 'package:food_wheel/widget/app_text.dart';
import 'package:shimmer/shimmer.dart';

class AppCard extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String address;

  const AppCard({Key key, this.imageUrl, this.name, this.address}) : super(key: key);
  @override
  _AppCardState createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
              child: SizedBox(
                height: getScreenHeight(context) / 7,
                width:getScreenHeight(context) / 7,
                child: CachedNetworkImage(
                  width: getScreenWidth(context),
                  fit: BoxFit.fitWidth,
                  imageUrl: widget.imageUrl,
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
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    AppText(
                      text: widget.name,
                      textSize: Dimens.paragraphHeaderTextSize,
                    ),
                    Dimens.height10,
                    AppText(
                      text: widget.address,
                      textSize: Dimens.paragraphTextSize,
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
