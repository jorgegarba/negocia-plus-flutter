import 'package:flutter/material.dart';
import 'package:negocia/screens/banner/providers/banner_providers.dart';
import 'package:negocia/theme/colors.dart';
import 'package:provider/provider.dart';

class BannerHeroTitleAction extends StatelessWidget {
  const BannerHeroTitleAction({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final banner = Provider.of<BannerProvider>(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Container(
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    banner.offerSelected.ofertaTit,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  Text(
                    banner.offerSelected.ofertaDesc,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 130,
            child: FlatButton(
              color: Colors.white,
              textColor: Colors.black,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: kprimaryColorYellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              onPressed: () {
                /*...*/
              },
              child: Row(
                children: [
                  Icon(
                    Icons.card_travel,
                    size: 18,
                    color: kprimaryColorPurple,
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      "A la lista de deseos",
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w500,
                          color: kprimaryColorPurple),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
