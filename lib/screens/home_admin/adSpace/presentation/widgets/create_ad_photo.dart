import 'package:flutter/material.dart';
import 'package:negocia/components/dashed_rect.dart';
import 'package:negocia/routing/router.dart';
import 'package:negocia/theme/colors.dart';

class CreateAdPhoto extends StatelessWidget {
  const CreateAdPhoto({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.createAdRoute),
      child: Row(
        children: [
          Expanded(flex: 4, child: Text('')),
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: new BoxDecoration(
                color: Color.fromRGBO(221, 221, 221, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DashedRect(
                color: Colors.grey,
                strokeWidth: 2.0,
                gap: 6.0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_a_photo,
                        size: 36,
                        color: kprimaryColorPurple,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          "Subir imagen del anuncio",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(flex: 4, child: Text('')),
        ],
      ),
    );
  }
}
