import 'package:flutter/material.dart';
import 'package:negocia/models/user_model.dart';
import 'package:negocia/screens/myprofile/providers/my_profile_provider.dart';
import 'package:negocia/theme/colors.dart';
import 'package:provider/provider.dart';

class MyProfileBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kprimaryColorYellow,
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Selector<MyProfileProvider, PerId>(
                    selector: (context, model) => model.user.perId,
                    builder: (context, perId, child) {
                      String namePerson = perId.perNom ?? "";
                      String apellidoPerson = perId.perApe ?? "";
                      return Text(
                        "$namePerson $apellidoPerson",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      );
                    }),
              ],
            ),
            FlatButton.icon(
              color: Colors.transparent,
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              label: Text(""),
            ),
          ],
        ),
      ),
    );
  }
}
