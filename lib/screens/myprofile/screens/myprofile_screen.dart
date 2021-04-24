import 'package:flutter/material.dart';
import 'package:negocia/components/layout.dart';
import 'package:negocia/screens/myprofile/widgets/myprofile_bar.dart';
import 'package:negocia/screens/myprofile/widgets/myprofile_card.dart';
import 'package:negocia/screens/myprofile/widgets/myprofile_card_info.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: Column(
      children: [
        MyProfileBar(),
        MyProfileCard(),
        MyProfileCardInfo(),
        FlatButton(
            onPressed: () {
              // Navigator.pushNamed(
              //   context,
              //   Routes.homeAdminRoute,
              // );
            },
            child: Text("data"))
      ],
    ));
  }
}
