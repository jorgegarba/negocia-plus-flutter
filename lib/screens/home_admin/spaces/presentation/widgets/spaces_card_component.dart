import 'package:flutter/material.dart';
import 'package:negocia/screens/home_admin/router/router.dart';
import 'package:negocia/screens/home_admin/spaces/data/models/empresa_model.dart';

class BannerCardAdmin extends StatelessWidget {
  final Pago pago;
  const BannerCardAdmin({@required this.pago}) : assert(pago != null);

  String get title => pago.espacios[0].espacioTit ?? '';
  String get description => pago.espacios[0].espacioDesc;
  String get isExpired => pago.espacios[0].est == true ? "Valido" : "Caducó";
  Color get isExpiredColor =>
      pago.espacios[0].est == true ? Colors.lightGreen : Colors.redAccent;

  List<Oferta> get ofertas => pago.espacios[0].ofertas;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
            context, RoutesAdmin.advertisingSpaceScreen,
            arguments: {'ofertas': ofertas}),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://cnnespanol.cnn.com/wp-content/uploads/2019/12/mejores-imagenes-del-ancc83o-noticias-2019-galeria10.jpg?quality=100&strip=info&w=320&h=240&crop=1")))),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          description,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.visible,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.favorite, color: Colors.grey),
                                Text(
                                  "14",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.chat_bubble, color: Colors.grey),
                                Text(
                                  "14",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.thumb_up, color: Colors.grey),
                                Text(
                                  "14",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                            Chip(
                                label: Text(
                                  isExpired,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                backgroundColor: isExpiredColor)
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
