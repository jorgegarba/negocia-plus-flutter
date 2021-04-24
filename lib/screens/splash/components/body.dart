import 'package:flutter/material.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/routing/router.dart';
import 'package:negocia/size_config.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {
      "title": "Bienvenido",
      "description":
          "Mensaje de bienvenida y descripcion del tutorial de imagenes a continuación"
    },
    {
      "title": "Bienvenido 2",
      "description":
          "Mensaje de bienvenida y descripcion del tutorial de imagenes a continuación"
    },
    {
      "title": "Bienvenido 3",
      "description":
          "Mensaje de bienvenida y descripcion del tutorial de imagenes a continuación"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg-1.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: PageView.builder(
                    onPageChanged: (value) => {
                      setState(() {
                        currentPage = value;
                      })
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => SplashContent(
                      description: splashData[index]["description"],
                      title: splashData[index]["title"],
                    ),
                  )),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: getProportionateScreenHeight(100),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: primaryColorYellow,
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.signUpRoute);
                          },
                          child: Text(
                            "Crear Cuenta",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(20),
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                            onPressed: () {
                              /*...*/
                            },
                            child: Text(
                              "¿ Ya tienes una cuenta ?",
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.signInRoute);
                            },
                            child: Text(
                              "Iniciar Sesión",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15,
                                  color: primaryColorPurple),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: animationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 70 : 60,
      decoration: BoxDecoration(
        color: currentPage == index ? primaryColorPurple : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.title,
    this.description,
  }) : super(key: key);

  final String title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(
            'assets/images/logo-1.png',
          ),
          width: getProportionateScreenWidth(150),
          height: getProportionateScreenHeight(150),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            width: 260,
            child: Center(
                child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
              ),
            ))),
      ],
    );
  }
}
