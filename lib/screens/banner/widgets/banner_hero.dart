import 'package:flutter/material.dart';
import 'package:negocia/screens/banner/widgets/banner_hero_card.dart';
import 'package:negocia/screens/banner/widgets/banner_hero_title_action.dart';

class BannerHero extends StatelessWidget {
  const BannerHero({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      decoration: BoxDecoration(
        color: Color.fromRGBO(253, 201, 19, 1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 6,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          children: [
            BannerHeroCard(),
            BannerHeroTitleAction(),
          ],
        ),
      ),
    );
  }
}
