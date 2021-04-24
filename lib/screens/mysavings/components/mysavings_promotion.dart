import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:negocia/models/consumos_model.dart';
import 'package:negocia/theme/colors.dart';
import 'package:negocia/utils/util.dart';

class MySavingsPromotion extends StatelessWidget {
  final Consumos consumos;
  final int index;

  MySavingsPromotion({@required this.consumos, @required this.index});

  @override
  Widget build(BuildContext context) {
    String fullDate = Utils().monthMes(dateTime: consumos.canjeFech);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      child: Slidable(
        key: ValueKey(index),
        actionPane: SlidableDrawerActionPane(),
        secondaryActions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: IconSlideAction(
              color: kprimaryColorYellow,
              icon: Icons.message,
              foregroundColor: Colors.white,
              closeOnTap: false,
              onTap: () => _settingModalBottomSheet(context),
            ),
          )
        ],
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 68,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      "http://lorempixel.com/500/500/",
                      width: 80,
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(consumos.ofertaSede.oferta.ofertaTit ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      new Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 12,
                              color: kprimaryColorYellow,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            new Text(fullDate),
                          ],
                        ),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            new Text(
                              "El Gaucho",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 12),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Color.fromRGBO(201, 238, 192, 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 15),
                                  child: Text(
                                    '+ S/${consumos.ofertaSede.oferta.ofertaPrecf.toString()}',
                                    style: TextStyle(
                                        color: Color.fromRGBO(40, 75, 38, 1),
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) =>
            RedeemConfirmationScreen()));
  }
}

class RedeemConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(
          0.85), // this is the main reason of transparency at next screen. I am ignoring rest implementation but what i have achieved is you can see.
      body: Container(
        child: new Column(
          children: <Widget>[
            new Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/images/logo-1.png"),
                    width: 150,
                  )
                ],
              ),
            ),
            new Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromRGBO(103, 39, 136, 1),
                          Color.fromRGBO(147, 128, 66, 1)
                        ]),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: kprimaryColorPurple,
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FlatButton.icon(
                                  onPressed: () => Navigator.pop(context),
                                  icon: Icon(
                                    Icons.cancel,
                                    color: kprimaryColorYellow,
                                  ),
                                  label: Text(""),
                                )
                              ]),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Comenta tu experiencia  en",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                                Text(
                                  "'Don Toribio'",
                                  style: TextStyle(
                                      color: kprimaryColorYellow,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ]),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Promocion:",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    "1 Pollo + Papas+ Ensalada + Gaseosa",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: kprimaryColorYellow,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      hintText: "Comentanos",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
