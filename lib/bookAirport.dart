import 'package:flutter/material.dart';

class BookingAir extends StatefulWidget {
  @override
  _BookingAir createState() => _BookingAir();
}

class _BookingAir extends State<BookingAir> {
  // for dropdown list items
  List<String> dropdownItems = ['   Yes', '   No'];

  //for "is it one way" variables
  String holderOneWay = ""; //holds the final value for one way
  var valueOneWay = null;

  //getting the data from one way dropdown
  void getDropdownOneWay() {
    setState(() {
      holderOneWay = valueOneWay;
    });
  }

  //for "personal assistance" variables
  String holderPersonal = ""; //holds the final value for personal assistance
  var valuePersonal = null;

  //getting the data from personal assistance dropdown
  void getDropdownPersonal() {
    setState(() {
      holderPersonal = valuePersonal;
    });
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                child: Padding(
                    padding: EdgeInsets.only(left: 15, top: 45, right: 15),
                    child: Column(children: [
                      RichText(
                        text: TextSpan(
                          text: "Book your ",
                          style: TextStyle(fontSize: 30, color: Colors.black),
                          children: const <TextSpan>[
                            TextSpan(
                              text: "flight",
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: ListView(children: [
                        SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_on_outlined),
                            fillColor: Colors.white54,
                            filled: true,
                            labelText: 'Where are you going?',
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_on),
                            fillColor: Colors.white54,
                            filled: true,
                            labelText: 'Where are you gonna come from?',
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                        SizedBox(height: 10),

                        //dropdown for "is it one way"
                        DropdownButton<String>(
                          value: valueOneWay,
                          hint: Text("   Is it a one way trip?"),
                          icon: Icon(Icons.arrow_drop_down),
                          onChanged: (String? data) {
                            setState(() {
                              valueOneWay = data!;
                            });
                          },
                          items: dropdownItems.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        //-----

                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.access_time),
                            fillColor: Colors.white54,
                            filled: true,
                            labelText: 'When are you going?',
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline_outlined),
                            fillColor: Colors.white54,
                            filled: true,
                            labelText: "Who's coming?",
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_add_alt_1),
                            fillColor: Colors.white54,
                            filled: true,
                            labelText: 'How many are coming?',
                          ),
                        ),
                        SizedBox(height: 10),

                        //dropdown for "personal assistance"
                        DropdownButton<String>(
                          value: valuePersonal,
                          hint: Text(
                              "   Does anyone require personal assistance?"),
                          icon: Icon(Icons.arrow_drop_down),
                          onChanged: (String? data) {
                            setState(() {
                              valuePersonal = data!;
                            });
                          },
                          items: dropdownItems.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        //-----

                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.sick),
                            fillColor: Colors.white54,
                            filled: true,
                            labelText: 'What assistance do they require?',
                          ),
                        ),
                        SizedBox(height: 25),
                        Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text('Submit',
                                        style: TextStyle(fontSize: 20)))),
                          ],
                        ),
                        SizedBox(height: 10),
                      ]))
                    ])))),
      );
}
