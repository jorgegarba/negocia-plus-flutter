import 'package:flutter/material.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/screens/home/components/screens_wrapper_app_bar.dart';
import 'package:negocia/screens/home_admin/spaces/presentation/provider/spaces_provide.dart';
import 'package:negocia/screens/home_admin/spaces/presentation/pages/spaces_screen.dart';
import 'package:provider/provider.dart';

class ScreensWrapperAdmin extends StatefulWidget {
  ScreensWrapperAdmin({Key key}) : super(key: key);

  @override
  _ScreensWrapperAdmin createState() => _ScreensWrapperAdmin();
}

class _ScreensWrapperAdmin extends State<ScreensWrapperAdmin> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle = TextStyle();
  static const List<Widget> _widgetOptions = <Widget>[
    SpacesScreen(),
    Text("data2"),
    Text("data3"),
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
        ChangeNotifierProvider(
          create: (_) => SpacesProvider(),
          lazy: false,
        ),
      ],
      child: Scaffold(
        appBar: screensWrapperAppBar(context),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              // ignore: deprecated_member_use
              title: Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  child: Text('Home', style: TextStyle(fontSize: 13))),
              backgroundColor: primaryColorPurple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.branding_watermark),
              // ignore: deprecated_member_use
              title: Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  child: Text('Mis Ahorros', style: TextStyle(fontSize: 13))),
              backgroundColor: primaryColorPurple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              // ignore: deprecated_member_use
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
