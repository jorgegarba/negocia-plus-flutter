import 'package:flutter/material.dart';

import 'package:negocia/components/layout.dart';
import 'package:negocia/components/text_dot.dart';

import 'package:negocia/models/espacios_model.dart';
import 'package:negocia/screens/banner/providers/banner_providers.dart';
import 'package:negocia/screens/banner/widgets/banner_hero.dart';
import 'package:negocia/screens/banner/widgets/banner_information.dart';
import 'package:negocia/theme/colors.dart';
import 'package:negocia/utils/util.dart';

import 'package:provider/provider.dart';

class BannerBodyScreen extends StatelessWidget {
  const BannerBodyScreen({Key key, this.espaciosModel}) : super(key: key);

  final EspaciosModel espaciosModel;

  @override
  Widget build(BuildContext context) {
    final BannerProvider banner = Provider.of<BannerProvider>(context);

    return Layout(
      padding: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Don Torivio",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
                Text(
                  "Restaurante",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          BannerHero(),
          SizedBox(
            height: 20,
          ),
          BannerInformation(
            title: 'Informacion adicional',
            icon: Icons.info,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO : PARSEAR DATA POR COMAS - PENDIENTE POR REVISAR
                TextDot(
                  description: banner.offerSelected.ofertaInfo,
                ),
              ],
            ),
          ),
          BannerInformation(
              color: Colors.white,
              title: 'Horario',
              icon: Icons.calendar_today,
              content: Container(
                height: banner.offerSelected.ofertasDias.length * 28.0,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: banner.offerSelected.ofertasDias.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      var hourInitConcat = StringBuffer();
                      final List hourInit = banner
                          .offerSelected.ofertasDias[index].ofDiaHin
                          .split(':')
                          .sublist(0, 2);
                      hourInit.forEach(
                          (element) => hourInitConcat.write(element + ':'));
                      var hourEndConcat = StringBuffer();
                      final List hourEnd = banner
                          .offerSelected.ofertasDias[index].ofDiaHfin
                          .split(':')
                          .sublist(0, 2);
                      hourEnd.forEach(
                          (element) => hourEndConcat.write(element + ':'));

                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: new Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.brightness_1,
                                      size: 5,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      banner.offerSelected.ofertasDias[index]
                                          .diaId.diaNom,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.alarm,
                                    size: 15,
                                    color: kprimaryColorYellow,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(hourInitConcat.toString()),
                                  Text(
                                    " a ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(hourEndConcat.toString()),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )),
          BannerInformation(
            title: 'Sedes',
            icon: Icons.map,
            elevation: 0,
            color: Colors.transparent,
            content: SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: banner.offerSelected.ofertasSedes.length,
                itemBuilder: (context, index) {
                  return _Sede(sede: banner.offerSelected.ofertasSedes[index]);
                },
              ),
            ),
          ),
          BannerInformation(
            title: 'Validez',
            icon: Icons.hourglass_empty,
            content: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Del : ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      Text(
                        Utils().monthMes(
                            dateTime: banner.offerSelected.ofertaFechin),
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  // Image.asset(
                  //   'assets/icons/arrow.png',
                  //   width: 30,
                  // ),
                  Row(
                    children: [
                      Text(
                        "Al : ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      Text(
                        Utils().monthMes(
                            dateTime: banner.offerSelected.ofertaFechfin),
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          BannerInformation(
            title: 'Antes',
            icon: Icons.hourglass_empty,
            elevation: 0,
            color: Colors.transparent,
            content: Text(
              'S./ ${banner.offerSelected.ofertaPreci}',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.lineThrough),
            ),
          ),
          BannerInformation(
            title: 'Ahora',
            icon: Icons.hourglass_empty,
            elevation: 0,
            color: Colors.transparent,
            content: Text(
              'S./ ${banner.offerSelected.ofertaPrecf}',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class _Sede extends StatelessWidget {
  _Sede({Key key, this.sede}) : super(key: key);

  final OfertasSede sede;
  @override
  Widget build(BuildContext context) {
    final banner = Provider.of<BannerProvider>(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () {
          banner.openMap(sede.sede.sedeLat, sede.sede.sedeLng);
        },
        child: Container(
          height: 80,
          width: 230,
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/location.png',
                  width: 72,
                ),
              ),
              Container(
                width: 158,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        sede.sede.sedeNom,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      // Text(
                      //   sede.sede.sedeTel,
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold, fontSize: 12),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
