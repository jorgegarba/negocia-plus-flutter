import 'package:flutter/material.dart';
import 'package:negocia/screens/home/components/home_categories.dart';
import 'package:negocia/screens/home/components/location.dart';
import 'package:negocia/screens/home/components/home_populars.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg-4.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Container(
                  //   height: 60,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       SearchBox(),
                  //       Container(
                  //         height: 50,
                  //         width: 50,
                  //         child: FlatButton(
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               Icon(
                  //                 Icons.filter_list,
                  //                 size: 18,
                  //               )
                  //             ],
                  //           ),
                  //           onPressed: () => _onButtonPressed(context),
                  //           textColor: Colors.white,
                  //           color: primaryColorYellow,
                  //           shape: OutlineInputBorder(
                  //             borderSide: BorderSide(
                  //                 style: BorderStyle.solid,
                  //                 width: 1.0,
                  //                 color: c_yellowPrimary),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  HomeCategories(),
                  SizedBox(
                    height: 20,
                  ),

                  HomePopulars()

                  // OfferCard(),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // OfferCard(),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // OfferCard(),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // OfferCard(),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // OfferCard()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onButtonPressed(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Location()],
            ),
          );
        });
  }

  void _selectItem(String name) {
    print(name);
  }
}
