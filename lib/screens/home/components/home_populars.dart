import 'package:flutter/material.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/models/espacios_model.dart';
import 'package:negocia/routing/router.dart';
import 'package:negocia/screens/home/components/subtitle_screens.dart';
import 'package:negocia/screens/home/providers/home_provider.dart';
import 'package:negocia/theme/colors.dart';
import 'package:provider/provider.dart';

class HomePopulars extends StatefulWidget {
  @override
  _HomePopularsState createState() => _HomePopularsState();
}

class _HomePopularsState extends State<HomePopulars> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SubtitleForScreens(subtitle: "Promociones"),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 20),
              child: InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, Routes.homeFilterRoute),
                child: Text(
                  "Filtrar",
                  style: TextStyle(
                    color: primaryColorPurple,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              Expanded(
                child:
                    Consumer<HomeProvider>(builder: (context, provider, child) {
                  if (provider.state == NotifierState.loading) {
                    return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: kprimaryColorYellow,
                    ));
                  } else if (provider.state == NotifierState.initial ||
                      provider.banners.isEmpty) {
                    return Center(
                        child: Text('No se encontro ningun resultado',
                            style: TextStyle(fontSize: 20)));
                  } else {
                    if (provider.failure != null && provider.banners.isEmpty) {
                      return Center(
                          child: Text(provider.failure.toString(),
                              style: TextStyle(fontSize: 20)));
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: provider.banners.length,
                          itemBuilder: (context, index) {
                            return CardBanners(banner: provider.banners[index]);
                          });
                    }
                  }
                }),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CardBanners extends StatelessWidget {
  const CardBanners({
    Key key,
    @required this.banner,
  }) : super(key: key);

  final EspaciosModel banner;

  @override
  Widget build(BuildContext context) {
    print(this.banner.espacioTit);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.bannerRoute,
            arguments: ({
              'object': this.banner,
            }));
      },
      child: Container(
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
                    height: 180,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 70),
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                          bottom: Radius.circular(10)),
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2), BlendMode.dstATop),
                        image: NetworkImage(
                            "https://static.iris.net.co/dinero/upload/images/2016/12/15/240194_1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 70,
                                height: 70,
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
                                  Text(
                                    "14",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.chat_bubble,
                                    color: primaryColorYellow,
                                  ),
                                  Text(
                                    "14",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.thumb_up,
                                    color: primaryColorYellow,
                                  ),
                                  Text(
                                    "14",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 65,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 55,
                                width: 220,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${this.banner.espacioTit}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                            fontSize: 15),
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "${this.banner.espacioDesc}",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 65,
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
                                      Navigator.pushNamed(
                                          context, Routes.bannerRoute,
                                          arguments: ({
                                            'object': this.banner,
                                          }));
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
