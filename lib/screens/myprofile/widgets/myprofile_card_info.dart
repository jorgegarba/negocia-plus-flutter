import 'package:flutter/material.dart';
import 'package:negocia/screens/myprofile/providers/my_profile_provider.dart';
import 'package:provider/provider.dart';

class MyProfileCardInfo extends StatelessWidget {
  const MyProfileCardInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Consumer<MyProfileProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                Info(
                  icon: Icons.mail,
                  title: 'Email',
                  desc: provider.user.usuMail ?? '',
                ),
                Info(
                  icon: Icons.phone,
                  title: 'Teléfono',
                  desc: provider.user.usuFono ?? '',
                ),
                Info(
                  icon: Icons.help_outline,
                  title: 'Ayuda',
                  desc: '',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  Info({this.icon, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Color.fromRGBO(136, 136, 136, 1),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                desc,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.arrow_forward_ios, size: 14),
            ],
          ),
        ],
      ),
    );
  }
}
