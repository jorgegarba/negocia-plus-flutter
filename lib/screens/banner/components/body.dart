import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/models/espacios_model.dart';
import 'package:negocia/routing/router.dart';
import 'package:negocia/services/advertising_space_service.dart';

class Body extends StatefulWidget {
  final int id;
  Body(this.id);

  @override
  _BodyState createState() {
    print(id);
    return _BodyState(id);
  }
}

class _BodyState extends State<Body> {
  int id;

  AdvertisingSpaceService _advertisingSpaceService = AdvertisingSpaceService();

  List<dynamic> oferts;

  var selected;
  var _status = 'loading';
  _BodyState(this.id);

  void getUsers() async {
    print("=============ddddEE======================================");
    print(id);
    int idBanner = this.id;
    var banners = await _advertisingSpaceService
        .getAdvertisingSpaceWithNameSecure(name: null);
    List<dynamic> r = banners.where((element) {
      EspaciosModel espaciosModel = element;
      return espaciosModel.espacioId == idBanner;
    }).toList();

    setState(() {
      _status = 'success';
      oferts = r[0].oferts;
      selected = oferts[0];
    });
    print(banners);
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg-4.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: _status == 'loading'
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                          color: secondaryColorYellow,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60)),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 180,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: oferts.length,
                                itemBuilder: (context, index) {
                                  final item = oferts[index];

                                  print(item["ofertaTit"]);
                                  return GestureDetector(
                                    onTap: () {
                                      print(index);
                                      print(item);
                                      setState(() {
                                        selected = item;
                                      });
                                    },
                                    child: Container(
                                      width: index == 0 ? 150 : 140,
                                      height: index == 0 ? 180 : 120,
                                      child: Card(
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Image.network(
                                          'http://lorempixel.com/500/500/',
                                          fit: BoxFit.fill,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 5,
                                        margin: index == 0
                                            ? EdgeInsets.all(5)
                                            : EdgeInsets.fromLTRB(8, 15, 8, 15),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          selected["ofertaTit"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          selected["ofertaDesc"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                  FlatButton(
                                    color: Colors.white,
                                    textColor: Colors.black,
                                    disabledColor: Colors.grey,
                                    disabledTextColor: Colors.black,
                                    padding: EdgeInsets.all(8.0),
                                    splashColor: primaryColorYellow,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    onPressed: () {
                                      /*...*/
                                    },
                                    child: Text(
                                      "A lista de deseos",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Information(information: selected["ofertaInfo"]),
                      Sedes(),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_view_day,
                                    color: primaryColorYellow,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    "Validez",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                child: Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                "Del : ${selected["ofertaFechin"]}"),
                                            Icon(Icons.arrow_forward,
                                                color: primaryColorYellow),
                                            Text(
                                                "Al : ${selected["ofertaFechfin"]}"),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      OldPrice(selected: selected),
                      SizedBox(height: 15),
                      ActualPrice(selected: selected),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
        ),
      ),
    );
    //  SafeArea(
    //   child: SizedBox(
    //     width: double.infinity,
    //     height: double.infinity,
    //     child: Container(
    //       child: SingleChildScrollView(
    //         child:
    //             Column(
    //               children: [

    //                 SizedBox(height: 20),
    //                 Information(),
    //                 ApplicableDays(),
    //                 Sedes(),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Text("Precio"),
    //                     FlatButton(
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.only(
    //                             topLeft: Radius.circular(30),
    //                             bottomLeft: Radius.circular(30)),
    //                       ),
    //                       color: primaryColorPurple,
    //                       textColor: Colors.white,
    //                       padding: EdgeInsets.all(10.0),
    //                       onPressed: () {
    //                         Navigator.pushNamed(context, ExChangeScreen.routeName);
    //                       },
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                         children: [
    //                           Container(
    //                             width: 60,
    //                             height: 60,
    //                             child: Center(
    //                               child: Text(
    //                                 "4",
    //                                 style: TextStyle(color: Colors.black),
    //                               ),
    //                             ),
    //                             decoration: BoxDecoration(
    //                               shape: BoxShape.circle,
    //                               color: Colors.white,
    //                             ),
    //                           ),
    //                           Icon(
    //                             Icons.arrow_forward_ios,
    //                             color: primaryColorYellow,
    //                           ),
    //                           Text(
    //                             "Canjear",
    //                             style: TextStyle(
    //                                 fontSize: 16.0, fontWeight: FontWeight.w700),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 SizedBox(height: 30),
    //               ],
    //             ),
    //             ),
    //       ),
    //     ),
    //   ),
  }
}

class OldPrice extends StatelessWidget {
  OldPrice({
    Key key,
    @required this.selected,
  }) : super(key: key);

  final selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.payment,
                    color: primaryColorYellow,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "Antes",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                ],
              ),
              Text(
                "   S./ ${selected["ofertaPreci"]}",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ActualPrice extends StatelessWidget {
  ActualPrice({
    Key key,
    @required this.selected,
  }) : super(key: key);

  final selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.payment,
                    color: primaryColorYellow,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "Ahora",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                ],
              ),
              Text(
                "   S./ ${selected["ofertaPrecf"]}",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
          ),
          color: primaryColorPurple,
          textColor: Colors.white,
          padding: EdgeInsets.all(10.0),
          onPressed: () {
            Navigator.pushNamed(context, Routes.methodRoute);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 60,
                height: 60,
                child: Center(
                  child: Text(
                    "4",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: primaryColorYellow,
              ),
              Text(
                "Canjear",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class Body extends StatelessWidget {

// }

class Sedes extends StatelessWidget {
  const Sedes({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: primaryColorYellow,
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "Sedes",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 0, 20),
                        child: Image.asset(
                          "assets/images/location.png",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                        child: Column(
                          children: [
                            Text(
                              "Parque Lambramani",
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 14),
                            ),
                            Text(
                              "Av. Lambramani",
                              overflow: TextOverflow.clip,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ApplicableDays extends StatelessWidget {
  const ApplicableDays({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: primaryColorYellow,
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "Dias aplicables",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lunes - Martes - Miercoles - Jueves - Domingo",
                            overflow: TextOverflow.clip,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Information extends StatelessWidget {
  final String information;

  Information({Key key, @required this.information}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.info,
                  color: primaryColorYellow,
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "Información Adicional",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("- $information"),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ClipBg extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - 30);
    var controllPoint = Offset(20, size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    throw true;
  }
}
