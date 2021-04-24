import 'package:flutter/material.dart';
import 'package:negocia/screens/home_admin/spaces/presentation/widgets/spaces_admin_titles.dart';
import 'package:negocia/screens/home_admin/spaces/presentation/widgets/reaction_component.dart';

class SpacesReaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAdminTitle(title: "Reacciones Logradas"),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Reaction(
              icon: Icons.folder_open,
              count: "250",
              title: "Me interesa",
            ),
            Reaction(
              icon: Icons.folder_open,
              count: "250",
              title: "Recomendado",
            ),
            Reaction(
              icon: Icons.folder_open,
              count: "250",
              title: "Me encanta",
            ),
          ],
        )
      ],
    );
  }
}
