import 'package:flutter/material.dart';
import 'package:negocia/components/layout.dart';
import 'package:negocia/screens/home_admin/adSpace/presentation/provider/advertising_space_provider.dart';
import 'package:negocia/screens/home_admin/adSpace/presentation/widgets/create_ad_form_fields.dart';
import 'package:negocia/screens/home_admin/adSpace/presentation/widgets/create_ad_photo.dart';
import 'package:negocia/screens/home_admin/spaces/presentation/widgets/spaces_admin_titles.dart';
import 'package:negocia/theme/colors.dart';
import 'package:provider/provider.dart';

class CreateAdScreen extends StatefulWidget {
  const CreateAdScreen({Key key}) : super(key: key);

  @override
  _CreateAdScreenState createState() => _CreateAdScreenState();
}

class _CreateAdScreenState extends State<CreateAdScreen> {
  int _selectedRadio = 0;

  @override
  Widget build(BuildContext context) {
    AdversitingSpaceProvider adversitingSpaceProvider =
        Provider.of<AdversitingSpaceProvider>(context);

    return Scaffold(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeAdminTitle(title: "Crear Anuncio"),
                Icon(
                  Icons.info_outline,
                  color: kprimaryColorYellow,
                )
              ],
            ),
            CreateAdPhoto(),
            HomeAdminText(text: 'Título :'),
            formFieldTitle(provider: adversitingSpaceProvider),
            HomeAdminText(text: 'Descripción :'),
            formFieldDescription(provider: adversitingSpaceProvider),
            HomeAdminText(text: 'Tipo Oferta :'),
            formFieldTypeOfOffer(provider: adversitingSpaceProvider),
            HomeAdminText(text: 'Cantidad de descuento (Ejm : 25%)'),
            formFieldDiscount(provider: adversitingSpaceProvider),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeAdminText(text: 'Información Adicional:'),
                addAdditionalInformationBox(
                    provider: adversitingSpaceProvider, context: context),
              ],
            ),
            additionalInformationList(provider: adversitingSpaceProvider),
            HomeAdminText(text: 'Dias Aplicables :'),
            aplicableDays(provider: adversitingSpaceProvider),
            Row(
              children: [
                HomeAdminText(text: 'Aplica Feriados :'),
                switchApplicableToHolidays(provider: adversitingSpaceProvider),
              ],
            ),
            Row(
              children: [
                HomeAdminText(text: 'Horarios :'),
                switchSchedule(provider: adversitingSpaceProvider),
              ],
            ),
            HomeAdminText(text: 'Cantidad de Canjes :'),
            sliderNumberOfExchanges(provider: adversitingSpaceProvider),
            HomeAdminText(text: 'Precio Antes :'),
            formFieldPriceBefore(provider: adversitingSpaceProvider),
            HomeAdminText(text: 'Precio Ahora :'),
            formFieldPriceNow(provider: adversitingSpaceProvider),
            HomeAdminText(text: 'Modalidad de Oferta :'),
            offerModality(provider: adversitingSpaceProvider),
            SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              height: 80,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  "Crear",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
