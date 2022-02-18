import 'package:flutter/material.dart';

class DownDropScreen extends StatefulWidget {
  const DownDropScreen({Key? key}) : super(key: key);

  @override
  _DownDropScreenState createState() => _DownDropScreenState();
}

class _DownDropScreenState extends State<DownDropScreen> {
  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("button"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            // dropdownColor: Colors.blueAccent,
            focusColor: Colors.amber,

            hint: Text(
              "Please choose a langauage",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(
                () {
                  dropdownvalue = newValue!;
                },
              );
            },
          )
        ],
      ),
    );
  }
}
