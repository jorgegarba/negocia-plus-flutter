import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: NetworkImage(
                "https://trome.pe/resizer/2B4eK2F7MB3a50VCTRVTzWiYvN8=/980x528/smart/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/NBCLDDF665HXDJORBXR7D77GRA.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.linearToSrgbGamma()),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    "https://image.freepik.com/vector-gratis/emblema-logo-comida-rapida_7087-753.jpg")))),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.lightbulb_outline),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.thumb_up),
                          color: Colors.yellow,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "1 Pollo + Papas + Ensalada + Gaseosa-Mr.Leña",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white),
                ),
                Text(
                  "Servicio de Comida a domicilio y restaurante de comida rápida",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                )
              ],
            )
          ],
        ),
      ) /* add child content here */,
    );

    // return Stack(
    //   children: [
    //     Card(
    //       semanticContainer: true,
    //       clipBehavior: Clip.antiAliasWithSaveLayer,
    //       child: Column(
    //         children: [
    //           Image.network(
    //             'https://placeimg.com/640/480/any',
    //             fit: BoxFit.fill,
    //           ),
    //           Text("data")
    //         ],
    //       ),
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(10.0),
    //       ),
    //       elevation: 5,
    //       margin: EdgeInsets.all(10),
    //     )
    //   ],
    // );
  }
}
