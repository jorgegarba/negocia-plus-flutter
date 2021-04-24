import 'package:flutter/material.dart';
import 'package:negocia/screens/banner/providers/banner_providers.dart';
import 'package:provider/provider.dart';

class BannerHeroCard extends StatelessWidget {
  const BannerHeroCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BannerProvider banner = Provider.of<BannerProvider>(context);

    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: banner.offerts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print(index);
              banner.ofertActual(index);
            },
            child: Container(
              width: banner.indexSelected == index ? 160 : 140,
              height: banner.indexSelected == index ? 200 : 120,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  'http://lorempixel.com/500/500/',
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 0,
                margin: banner.indexSelected == index
                    ? EdgeInsets.fromLTRB(5, 5, 5, 0)
                    : EdgeInsets.fromLTRB(10, 5, 5, 25),
              ),
            ),
          );
        },
      ),
    );

    // Container(
    //   width: 150,
    //   height: 180,
    //   child: Card(
    //     semanticContainer: true,
    //     clipBehavior: Clip.antiAliasWithSaveLayer,
    //     child: ImageNetworkLoading(
    //       url: 'http://lorempixel.com/500/500/',
    //     ),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(10.0),
    //     ),
    //     elevation: 5,
    //     margin: EdgeInsets.all(5),
    //   ),
    // );
  }
}
