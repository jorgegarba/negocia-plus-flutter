import 'package:flutter/material.dart';
import 'package:negocia/components/error_page.dart';
import 'package:negocia/models/espacios_model.dart';
import 'package:negocia/models/plan_model.dart';
import 'package:negocia/screens/banner/screens/banner_screen.dart';
import 'package:negocia/screens/exchange/screens/method_screen.dart';
import 'package:negocia/screens/exchange/screens/scan_result_screen.dart';
import 'package:negocia/screens/exchange/screens/scan_success_screen.dart';
import 'package:negocia/screens/home/screens/filter_screen.dart';
import 'package:negocia/screens/home/screens/screens_wrapper.dart';
import 'package:negocia/screens/home_admin/adSpace/presentation/pages/advertising_space_screen.dart';
import 'package:negocia/screens/home_admin/adSpace/presentation/provider/advertising_space_provider.dart';
import 'package:negocia/screens/home_admin/plan/presentation/provider/plan_space_provider.dart';
import 'package:negocia/screens/home_admin/router/router.dart';
import 'package:negocia/screens/home_admin/spaces/data/models/empresa_model.dart';
import 'package:negocia/screens/home_admin/spaces/presentation/provider/spaces_provide.dart';
import 'package:negocia/screens/home_admin/adSpace/presentation/pages/create_ad_screen.dart';
import 'package:negocia/screens/home_admin/plan/presentation/screens/plan_payment_screen.dart';
import 'package:negocia/screens/home_admin/plan/presentation/screens/plan_screen.dart';
import 'package:negocia/screens/home_admin/plan/presentation/screens/plan_space_screen.dart';
import 'package:negocia/screens/home_admin/screens_wrapper_admin.dart';
import 'package:negocia/screens/sign_in/sign_in_screen.dart';
import 'package:negocia/screens/sign_up/screens/sign_up_screen.dart';
import 'package:negocia/screens/sign_up/screens/sign_up_confirm_screen.dart';
import 'package:negocia/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';

class Routes {
  static const homeRoute = 'home-page';

  static const initialRoute = 'initial-page';
  static const signInRoute = 'sign-in-page';
  static const signUpRoute = 'sign-up-page';
  static const signUpConfirmRoute = 'sign-up-confirm-page';
  static const bannerRoute = 'banner-page';
  static const methodRoute = 'method-page';
  static const scanSuccessRoute = 'scan-success-page';
  static const scanResultRoute = 'scan-result-page';
  static const homeFilterRoute = 'home-filter-page';
  static const planSpaceRoute = "plan-space-page";
  static const planPaymentRoute = "plan-payment-page";
  static const createAdRoute = "create-ad-page";
}

class MyRouter {
  // ignore: missing_return
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final path = settings.name.split('/');
    final module = path[0];
    if (module == Routes.homeRoute) {
      final Map<String, dynamic> map = args;
      final String _rol = map['rol'];
      switch (_rol) {
        case "ADMIN":
          return MaterialPageRoute(builder: (_) => ScreensWrapperAdmin());
        case "SUPERADMIN":
          return MaterialPageRoute(builder: (_) => ErrorPage(rol: "... Error"));
        case "CLI":
          return MaterialPageRoute(builder: (_) => ScreensWrapper());
        default:
          return MaterialPageRoute(builder: (_) => ErrorPage(rol: _rol));
      }
    } else if (module == RoutesAdmin.adminPages) {
      // routerAdmin(args, settings.name);
      switch (settings.name) {
        case RoutesAdmin.planScreen:
          return MaterialPageRoute(builder: (_) => PlanScreen());
        case RoutesAdmin.advertisingSpaceScreen:
          final Map<String, dynamic> map = args;
          final List<Oferta> _oferta = map['ofertas'];
          return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider.value(
              value: SpacesProvider(),
              child: AdvertisingSpaceScreen(oferta: _oferta),
            ),
          );
        default:
      }
    } else {
      switch (settings.name) {
        case Routes.initialRoute:
          return MaterialPageRoute(builder: (_) => SplashScreen());
        case Routes.signInRoute:
          return MaterialPageRoute(builder: (_) => SignInScreen());
        case Routes.signUpRoute:
          return MaterialPageRoute(builder: (_) => SignUpScreen());
        case Routes.signUpConfirmRoute:
          final Map<String, dynamic> mapArgs = args;
          final String email = mapArgs['email'];
          final String password = mapArgs['password'];
          if (args != null) {
            return MaterialPageRoute<dynamic>(
                builder: (_) => SignUpConfirm(
                      email: email,
                      password: password,
                    ));
          }
          return MaterialPageRoute(
              builder: (_) => ErrorPage(rol: "EL CLIENTE"));
        case Routes.bannerRoute:
          final Map<String, dynamic> mapArgs = args;
          final EspaciosModel _espaciosModel = mapArgs['object'];
          return MaterialPageRoute<dynamic>(
              builder: (_) => BannerScreen(espaciosModel: _espaciosModel));
        case Routes.scanSuccessRoute:
          return MaterialPageRoute(builder: (_) => ScanSuccessScreen());
        case Routes.methodRoute:
          final Map<String, dynamic> mapArgs = args;
          return MaterialPageRoute(
            builder: (_) => MethodScreen(
                fono: mapArgs["fono"],
                idEmpresa: mapArgs["idEmpresa"],
                idOferta: mapArgs["idOferta"],
                ofertaDelivery: mapArgs["ofertaDelivery"]),
          );
        case Routes.scanResultRoute:
          final Map<String, dynamic> mapArgs = args;
          final bool response = mapArgs['response'];
          final int sedeId = mapArgs['sedeId'];
          return MaterialPageRoute(
              builder: (_) =>
                  ScanResultScreen(response: response, sedeId: sedeId));
        case Routes.homeFilterRoute:
          return MaterialPageRoute(builder: (_) => HomeFilter());
        case Routes.planSpaceRoute:
          final Map<String, dynamic> mapArgs = args;
          final Plan _plan = mapArgs['object'];
          return MaterialPageRoute(
            builder: (_) => MultiProvider(
              providers: [
                Provider<Plan>.value(value: _plan),
                ChangeNotifierProvider.value(value: PlanSpaceProvider()),
              ],
              child: PlanSpaceScreen(),
            ),
          );
        case Routes.planPaymentRoute:
          final Map<String, dynamic> mapArgs = args;
          final Plan _plan = mapArgs['object'];
          return MaterialPageRoute(
              builder: (_) => PlanPaymentScreen(plan: _plan));

        case Routes.createAdRoute:
          return MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider.value(
                  value: AdversitingSpaceProvider(), child: CreateAdScreen()));
        default:
          return MaterialPageRoute(
              builder: (_) => ErrorPage(rol: "EL CLIENTE"));
        //return null;
      }
    }
  }
}
