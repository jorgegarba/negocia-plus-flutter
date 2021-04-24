import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:negocia/components/error_page.dart';
import 'package:negocia/providers/user_provider.dart';
import 'package:negocia/routing/router.dart';
import 'package:negocia/screens/home/screens/screens_wrapper.dart';
import 'package:negocia/screens/home_admin/screens_wrapper_admin.dart';
import 'package:negocia/screens/loading/loading_screen.dart';
import 'package:negocia/screens/splash/splash_screen.dart';
import 'package:negocia/theme/colors.dart';
import 'package:negocia/theme/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Banner
  // Banner

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: kprimaryColorYellow, // navigation bar color
        statusBarColor: kprimaryColorPurple, // status bar color
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: Colors.white));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      onGenerateRoute: MyRouter.onGenerateRoute,
      home: ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
          lazy: false,
          child: Consumer(builder: (context, UserProvider user, _) {
            print(user.status);
            if (user.status == Status.Uninitialized) {
              return LoadingScreen();
            }
            if (user.status == Status.AuthenticatedCLI) {
              return ScreensWrapper();
            }
            if (user.status == Status.AuthenticatedADMIN) {
              return ScreensWrapperAdmin();
            }
            if (user.status == Status.AuthenticatedSUPERADMIN) {
              return ErrorPage(rol: "... Error");
            }
            if (user.status == Status.Unauthenticated) {
              return SplashScreen();
            }
            if (user.status == Status.Authenticating) {
              return LoadingScreen();
            } else {
              return LoadingScreen();
            }
          })),
    );
  }
}
