import 'package:flutter/material.dart';
import 'package:negocia/components/dashed_rect.dart';
import 'package:negocia/theme/colors.dart';

class StepsComponent extends StatelessWidget {
  const StepsComponent({Key key, @required this.step}) : super(key: key);
  final int step;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Planes",
                  style: TextStyle(
                    color: Color(0xff444444),
                    fontSize: 20,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Comprar un espacio publicitario",
                  style: TextStyle(
                    color: Color(0xff444444),
                    fontSize: 13,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          _circleStep(
              text: 'Elegir plan',
              number: '1',
              color: step == 1 ? kprimaryColorPurple : ktransparent),
          Column(
            children: [
              Container(
                height: 2.0,
                width: 20.0,
                color: Colors.white,
                child: DashedRect(
                  color: kprimaryColorPurple,
                  strokeWidth: 1.0,
                  gap: 3.0,
                ),
              ),
              SizedBox(height: 6)
            ],
          ),
          _circleStep(
              text: 'Método de Pago',
              number: '2',
              color: step == 2 ? kprimaryColorPurple : ktransparent),
          Column(
            children: [
              Container(
                height: 2.0,
                width: 20.0,
                color: Colors.white,
                child: DashedRect(
                  color: kprimaryColorPurple,
                  strokeWidth: 1.0,
                  gap: 3.0,
                ),
              ),
              SizedBox(height: 6)
            ],
          ),
          _circleStep(
              text: 'Método de Pago',
              number: '3',
              color: step == 3 ? kprimaryColorPurple : ktransparent),
        ],
      ),
    );
  }

  Widget _circleStep({String text, String number, Color color}) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: kprimaryColorPurple,
                width: 1,
              ),
              color: color,
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              text,
              overflow: TextOverflow.visible,
              style: TextStyle(
                color: Color(0xff888888),
                fontSize: 8,
                fontFamily: "Raleway",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
