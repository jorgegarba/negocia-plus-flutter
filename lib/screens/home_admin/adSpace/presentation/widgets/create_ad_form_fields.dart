import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:negocia/screens/home_admin/adSpace/presentation/provider/advertising_space_provider.dart';
import 'package:negocia/theme/colors.dart';

Widget formFieldTitle({AdversitingSpaceProvider provider}) {
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

Widget formFieldDescription({AdversitingSpaceProvider provider}) {
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

Widget formFieldTypeOfOffer({AdversitingSpaceProvider provider}) {
  return TextFormField(
    keyboardType: TextInputType.text,
    textCapitalization: TextCapitalization.sentences,
    onChanged: (typeOfOffer) =>
        provider.validateTypeOfOffer(typeOfOffer: typeOfOffer),
    decoration: InputDecoration(
      hintText: "Seleccione Tipo Oferta",
      errorText: provider.typeOfOffer.error,
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
  );
}

Widget formFieldDiscount({AdversitingSpaceProvider provider}) {
  return TextFormField(
    keyboardType: TextInputType.name,
    textCapitalization: TextCapitalization.sentences,
    onChanged: (discount) => provider.validateDiscount(discount: discount),
    decoration: InputDecoration(
      hintText: "Ingrese descuento",
      errorText: provider.discount.error,
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
  );
}

Widget addAdditionalInformationBox(
    {AdversitingSpaceProvider provider, BuildContext context}) {
  return InkWell(
    onTap: () {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Agregue Información adicional"),
                content: Container(
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: null,
                    onChanged: (additionalInformation) =>
                        provider.validateAdditionalInformation(
                            additionalInformation: additionalInformation),
                    decoration: InputDecoration(
                      hintText: "Ingrese Información adicional",
                      errorText: provider.additionalInformation.error,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        child: Text("Close"),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      FlatButton(
                        child: Text("Agregar"),
                        onPressed: () {
                          if (provider.additionalInformation.error == null) {
                            provider.addAdditionalInformation(
                                additionalInformation:
                                    provider.additionalInformation.value);
                            Navigator.of(context).pop();
                          } else {
                            return null;
                          }
                        },
                      )
                    ],
                  ),
                ],
              ));
    },
    child: Icon(
      Icons.add_box,
      color: kprimaryColorYellow,
      size: 30,
    ),
  );
}

Widget additionalInformationList({AdversitingSpaceProvider provider}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView.builder(
        itemCount: provider.additionalInformationList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Text('')),
              SizedBox(width: 5),
              Expanded(
                child: Text(
                  provider.additionalInformationList[index],
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          );
        }),
  );
}

Widget aplicableDays({AdversitingSpaceProvider provider}) {
  return Wrap(
    alignment: WrapAlignment.start,
    spacing: 5,
    runSpacing: 2,
    children: [
      Transform.scale(
        scale: 1.0,
        child: Wrap(
          children: [
            Checkbox(
              value: provider.lunes,
              activeColor: kprimaryColorPurple,
              // checkColor: kprimaryColorYellow,
              onChanged: (bool value) => provider.tapLunes(value: value),
              autofocus: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text('Lunes'),
            )
          ],
        ),
      ),
      Transform.scale(
        scale: 1.0,
        child: Wrap(
          children: [
            Checkbox(
              value: provider.martes,
              activeColor: kprimaryColorPurple,
              // checkColor: kprimaryColorYellow,
              onChanged: (bool value) => provider.tapMartes(value: value),
              autofocus: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text('Martes'),
            )
          ],
        ),
      ),
      Transform.scale(
        scale: 1.0,
        child: Wrap(
          children: [
            Checkbox(
              value: provider.miercoles,
              activeColor: kprimaryColorPurple,
              // checkColor: kprimaryColorYellow,
              onChanged: (bool value) => provider.tapMiercoles(value: value),
              autofocus: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text('Miercoles'),
            )
          ],
        ),
      ),
      Transform.scale(
        scale: 1.0,
        child: Wrap(
          children: [
            Checkbox(
              value: provider.jueves,
              activeColor: kprimaryColorPurple,
              // checkColor: kprimaryColorYellow,
              onChanged: (bool value) => provider.tapJueves(value: value),
              autofocus: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text('Jueves'),
            )
          ],
        ),
      ),
      Transform.scale(
        scale: 1.0,
        child: Wrap(
          children: [
            Checkbox(
              value: provider.viernes,
              activeColor: kprimaryColorPurple,
              // checkColor: kprimaryColorYellow,
              onChanged: (bool value) => provider.tapViernes(value: value),
              autofocus: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text('Viernes'),
            )
          ],
        ),
      ),
      Transform.scale(
        scale: 1.0,
        child: Wrap(
          children: [
            Checkbox(
              value: provider.sabado,
              activeColor: kprimaryColorPurple,
              // checkColor: kprimaryColorYellow,
              onChanged: (bool value) => provider.tapSabado(value: value),
              autofocus: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text('Sabado'),
            )
          ],
        ),
      ),
      Transform.scale(
        scale: 1.0,
        child: Wrap(
          children: [
            Checkbox(
              value: provider.domingo,
              activeColor: kprimaryColorPurple,
              // checkColor: kprimaryColorYellow,
              onChanged: (bool value) => provider.tapDomingo(value: value),
              autofocus: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text('Domingo'),
            )
          ],
        ),
      ),
    ],
  );
}

Widget switchApplicableToHolidays({AdversitingSpaceProvider provider}) {
  return Row(
    children: [
      Switch(
        value: provider.applicableToHolidays,
        onChanged: (value) => provider.isApplicableToHolidays(value: value),
        activeTrackColor: kprimaryColorYellow,
        activeColor: Colors.white,
      ),
      Text(provider.applicableToHolidays ? 'Si' : 'No')
    ],
  );
}

Widget switchSchedule({AdversitingSpaceProvider provider}) {
  return Row(
    children: [
      Switch(
        value: provider.schedule,
        onChanged: (value) => provider.isSchedule(value: value),
        activeTrackColor: kprimaryColorYellow,
        activeColor: Colors.white,
      ),
      Text(provider.schedule ? 'Todo el día' : 'No todo el día')
    ],
  );
}

Widget sliderNumberOfExchanges({AdversitingSpaceProvider provider}) {
  return Slider.adaptive(
    min: 0,
    max: 5,
    value: provider.numberOfExchanges,
    onChanged: (newValue) => provider.sliderNumberOfExchanges(value: newValue),
    divisions: 5,
    label: "${provider.numberOfExchanges.toInt()} Canjes",
    activeColor: kprimaryColorPurple,
    inactiveColor: kprimaryColorYellow,
  );
}

Widget formFieldPriceBefore({AdversitingSpaceProvider provider}) {
  return TextFormField(
    keyboardType: TextInputType.number,
    textCapitalization: TextCapitalization.sentences,
    onChanged: (price) => provider.validatePriceBefore(priceBefore: price),
    decoration: InputDecoration(
      hintText: "Ingrese el precio Anterior",
      errorText: provider.priceBefore.error,
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
  );
}

Widget formFieldPriceNow({AdversitingSpaceProvider provider}) {
  return TextFormField(
    keyboardType: TextInputType.number,
    textCapitalization: TextCapitalization.sentences,
    onChanged: (price) => provider.validatePriceNow(priceNow: price),
    decoration: InputDecoration(
      hintText: "Ingrese el precio actual",
      errorText: provider.priceNow.error,
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
  );
}

Widget offerModality({AdversitingSpaceProvider provider}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ButtonBar(
        alignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Presencial'),
              Radio(
                value: 1,
                groupValue: provider.offerModality,
                activeColor: kprimaryColorPurple,
                onChanged: (modality) =>
                    provider.selectOfferModality(modality: modality),
              ),
            ],
          ),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Delivery'),
              Radio(
                value: 2,
                groupValue: provider.offerModality,
                activeColor: kprimaryColorPurple,
                onChanged: (modality) =>
                    provider.selectOfferModality(modality: modality),
              ),
            ],
          ),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Ambos'),
              Radio(
                value: 3,
                groupValue: provider.offerModality,
                activeColor: kprimaryColorPurple,
                onChanged: (modality) =>
                    provider.selectOfferModality(modality: modality),
              ),
            ],
          ),
        ],
      )
    ],
  );
}
