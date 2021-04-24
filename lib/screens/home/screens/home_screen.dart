import 'package:flutter/material.dart';
import 'package:negocia/screens/home/components/home_populars.dart';
import 'package:negocia/screens/home/components/home_categories.dart';
import 'package:negocia/screens/home/components/home_search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg-4.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HomeSearch(),
              HomeCategories(),
              // PopularBanners(),
              HomePopulars()
              // PopularCompanies(),
            ],
          ),
        ),
      ),
    );
  }
  //  Scaffold(
  //   backgroundColor: Colors.grey.shade200,
  //   body: SingleChildScrollView(
  //     physics: BouncingScrollPhysics(),
  //     scrollDirection: Axis.vertical,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       mainAxisSize: MainAxisSize.min,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         SizedBox(
  //           height: 200,
  //         ),
  //         Text("data"),
  //         SizedBox(
  //           height: 200,
  //         ),
  //         Text("data"),
  //         SizedBox(
  //           height: 200,
  //         ),
  //         Text("data")
  //         // Categories(),
  //         // PopularBanners(),
  //         // PopularBanners(),
  //         // PopularCompanies(),
  //       ],
  //     ),
  //   ),
  // );

}
