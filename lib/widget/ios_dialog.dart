
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_wheel/localization/flutter_localizations.dart';
import 'package:food_wheel/theme/colors.dart';
import 'package:food_wheel/theme/dimens.dart';
import 'package:food_wheel/widget/app_text.dart';

class IOSDialog extends StatefulWidget {
  final String title;
  final String content;
  final Function cancel;
  final Function confirm;

  const IOSDialog(
      {Key key, this.title, this.content, this.cancel, this.confirm})
      : super(key: key);

  @override
  _IOSDialogState createState() => _IOSDialogState();
}

class _IOSDialogState extends State<IOSDialog> {
  bool enable;

  @override
  void initState() {
    enable = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: AppText(
        text: widget.title ?? '',
        color: AppColors.black,

      ),
      content: AppText(
        text: widget.content ?? '',
        color: AppColors.black,
        textSize: Dimens.errorTextSize,
      ),
      actions: <Widget>[
        Row(
          children: <Widget>[
            widget.cancel != null
                ? Expanded(
                    child: FlatButton(
                        onPressed: widget.cancel,
                        child: AppText(
                          text: FlutterLocalizations.of(context)
                              .getString(context, 'cancel'),
                          color: AppColors.red,
                        )))
                : SizedBox(),
            widget.confirm != null
                ? Expanded(
                    child: FlatButton(
                        onPressed: () {
                          if (enable) {
                            widget.confirm();
                          }
                          setState(() {
                            enable = false;
                          });
                        },
                        child: AppText(
                          text: FlutterLocalizations.of(context)
                              .getString(context, 'confirm'),
                          color: AppColors.clickableText,
                        )))
                : SizedBox()
          ],
        )
      ],
    );
  }
}
