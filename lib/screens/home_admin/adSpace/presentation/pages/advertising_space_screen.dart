import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:negocia/components/dashed_rect.dart';
import 'package:negocia/components/layout.dart';
import 'package:negocia/routing/router.dart';
import 'package:negocia/screens/home_admin/adSpace/presentation/provider/advertising_space_provider.dart';
import 'package:negocia/screens/home_admin/adSpace/presentation/widgets/adversiting_space_card.dart';
import 'package:negocia/screens/home_admin/spaces/data/models/empresa_model.dart';
import 'package:negocia/screens/home_admin/spaces/presentation/widgets/spaces_admin_titles.dart';
import 'package:negocia/screens/home_admin/spaces/presentation/provider/spaces_provide.dart';
import 'package:negocia/theme/colors.dart';
import 'package:provider/provider.dart';

class AdvertisingSpaceScreen extends StatelessWidget {
  final List<Oferta> oferta;
  const AdvertisingSpaceScreen({@required this.oferta});

  @override
  Widget build(BuildContext context) {
    print(json.encode(oferta));
    final _spacesProvider = Provider.of<SpacesProvider>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AdversitingSpaceProvider>(
          create: (_) => AdversitingSpaceProvider(),
          lazy: false,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/icons/icon-negocia-plus.png',
            height: 30,
          ),
        ),
        body: Layout(
          padding: 15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAdminTitle(title: "Administrar mi espacio publicitario"),
              SizedBox(height: 20),
              Text('Mis anuncios (2 de 4):'),
              SizedBox(height: 15),
              AdversitingSpaceCard(),
              AdversitingSpaceCard(),
              AdversitingSpaceToCreate(),
              AdversitingSpaceToCreate(),
              Text(_spacesProvider.value)
            ],
          ),
        ),
      ),
    );
  }
}

class AdversitingSpaceToCreate extends StatelessWidget {
  const AdversitingSpaceToCreate({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.createAdRoute),
      child: Center(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: DashedRect(
            color: Colors.grey,
            strokeWidth: 2.0,
            gap: 6.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 36,
                    color: kprimaryColorPurple,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Center(
                        child: Text(
                      "Crear un nuevo anuncio o sube una imagen",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                      overflow: TextOverflow.visible,
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
