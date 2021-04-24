import 'package:flutter/material.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/routing/router.dart';
import 'package:negocia/screens/home/screens/filter_screen.dart';

class PopularBanners extends StatelessWidget {
  List<DropdownMenuItem> _dropdownItems = [
    DropdownMenuItem<String>(
      child: Text('Item 1'),
      value: 'one',
    ),
    DropdownMenuItem<String>(
      child: Text('Item 1'),
      value: 'one',
    ),
  ];

  void filterBanner(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return HomeFilter();
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, bottom: 0, top: 10, right: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Promociones",
                  style: TextStyle(
                      color: Color.fromRGBO(68, 68, 68, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                ),
                FlatButton(
                  onPressed: () {
                    /*...*/
                    filterBanner(context);
                  },
                  child: Text(
                    "Filtrar",
                    style: TextStyle(
                      color: primaryColorPurple,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: SizedBox(
              child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    PopularBanner(),
                    PopularBanner(),
                    PopularBanner(),
                  ]),
            ),
          )
        ]);
  }
}

class PopularBanner extends StatelessWidget {
  const PopularBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 10, bottom: 10),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
            width: double.infinity,
            height: 180,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://static.iris.net.co/dinero/upload/images/2016/12/15/240194_1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 10, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(60, 0, 0, 0),
                                  blurRadius: 5.0,
                                  offset: Offset(5.0, 5.0))
                            ],
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://static.mercadonegro.pe/wp-content/uploads/2020/03/22191450/m2.jpg"),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: primaryColorYellow,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 55,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 55,
                        width: 190,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pollos a la brasa 2X1",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 15),
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "Pollitos a la brasa ricolinos p",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 55,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(10)),
                            color: primaryColorYellow),
                        child: Center(
                          child: IconButton(
                            icon: new Icon(Icons.arrow_forward),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.bannerRoute);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
