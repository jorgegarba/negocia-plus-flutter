import 'package:flutter/material.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/models/categories.dart';
import 'package:negocia/screens/home/components/screens_wrapper_app_bar.dart';
import 'package:negocia/screens/home/providers/home_provider.dart';
import 'package:negocia/screens/home/screens/home_screen.dart';
import 'package:negocia/screens/myprofile/providers/my_profile_provider.dart';
import 'package:negocia/screens/myprofile/screens/myprofile_screen.dart';
import 'package:negocia/screens/mysavings/providers/mysavings_provider.dart';
import 'package:negocia/screens/mysavings/screens/mysavings_screen.dart';
import 'package:provider/provider.dart';

class ScreensWrapper extends StatefulWidget {
  ScreensWrapper({Key key}) : super(key: key);

  @override
  _ScreensWrapperState createState() => _ScreensWrapperState();
}

class _ScreensWrapperState extends State<ScreensWrapper> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle();
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MySavingsScreen(),
    MyProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyProfileProvider>(
          create: (context) => MyProfileProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider<MySavingProvider>(
          create: (context) => MySavingProvider(),
          lazy: false,
        )
      ],
      child: Scaffold(
        appBar: screensWrapperAppBar(context),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  child: Text('Home', style: TextStyle(fontSize: 13))),
              backgroundColor: primaryColorPurple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.branding_watermark),
              title: Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  child: Text('Mis Ahorros', style: TextStyle(fontSize: 13))),
              backgroundColor: primaryColorPurple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  child: Text('Mi Perfil', style: TextStyle(fontSize: 13))),
              backgroundColor: primaryColorPurple,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: primaryColorYellow,
          onTap: _onItemTapped,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
