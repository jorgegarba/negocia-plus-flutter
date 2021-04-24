import 'package:flutter/material.dart';
import 'package:negocia/components/layout.dart';
import 'package:negocia/screens/home_admin/spaces/presentation/widgets/spaces_reaction.dart';
import 'package:negocia/screens/home_admin/spaces/presentation/widgets/spaces_list.dart';

class SpacesScreen extends StatelessWidget {
  const SpacesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      padding: 15,
      child: Column(children: [
        SpacesReaction(),
        SpacesList(),
      ]),
    );
  }
}
