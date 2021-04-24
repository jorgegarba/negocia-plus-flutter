import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:negocia/screens/home_admin/plan/presentation/provider/plan_space_provider.dart';

Widget formFieldPlanSpaceTitle({PlanSpaceProvider provider}) {
  return TextFormField(
    keyboardType: TextInputType.text,
    textCapitalization: TextCapitalization.sentences,
    onChanged: (title) => provider.validateTitle(title: title),
    decoration: InputDecoration(
      hintText: "Ingrese Título",
      errorText: provider.title.error,
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
  );
}

Widget formFieldPlanSpaceDescription({PlanSpaceProvider provider}) {
  return TextFormField(
    keyboardType: TextInputType.text,
    textCapitalization: TextCapitalization.sentences,
    onChanged: (description) =>
        provider.validateDescription(description: description),
    maxLines: null,
    decoration: InputDecoration(
      hintText: "Ingrese Descripción",
      errorText: provider.description.error,
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
  );
}
