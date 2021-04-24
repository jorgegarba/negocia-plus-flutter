import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ubicación',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 150,
              child: DropdownButton(
                  value: 1,
                  isExpanded: true,
                  icon: Icon(Icons.search),
                  items: [
                    DropdownMenuItem(
                      child: Text("Arequipa"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Lima"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("Trujillo"),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text("Tacna"),
                      value: 4,
                    )
                  ],
                  onChanged: (value) {}),
            ),
            Container(
              width: 150,
              child: DropdownButton(
                  value: 1,
                  isExpanded: true,
                  icon: Icon(Icons.search),
                  items: [
                    DropdownMenuItem(
                      child: Text("Arequipa"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Lima"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("Trujillo"),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text("Tacna"),
                      value: 4,
                    )
                  ],
                  onChanged: (value) {}),
            ),
          ],
        ),
      ],
    );
  }
}
