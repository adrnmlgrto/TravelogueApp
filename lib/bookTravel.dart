import 'package:flutter/material.dart';
import 'package:myflutter/ticket.dart';

class BookingHotel extends StatefulWidget {
  @override
  _BookingHotel createState() => _BookingHotel();
}

class _BookingHotel extends State<BookingHotel> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _who = new TextEditingController();
  TextEditingController _howMany = new TextEditingController();
  TextEditingController _kindAssist = new TextEditingController();

  // for dropdown list items
  List<String> dropdownItems = ['   Yes', '   No'];

  List<String> dropdownGo = [
    '   Shanghai, China',
    '   Vancouver, Canada',
    '   Tokyo, Japan',
    '   Jeju, South Korea',
  ];

  List<String> dropdownWhen = [
    '   October 12, 2021 | 8:00AM',
    '   October 13, 2021 | 3:00PM',
    '   October 13, 2021 | 10:00PM',
    '   October 14, 2021 | 1:00PM',
  ];

  //for "where r u going" variables
  String holderGo = ""; //holds the final value for where r u going
  var valueGo = null;

  //getting the data from where r u going dropdown
  void getDropdownGo() {
    setState(() {
      holderGo = valueGo;
    });
  }

  //for "coming from" variables
  String holderFrom = ""; //holds the final value for coming from
  var valueFrom = null;

  //getting the data from coming from dropdown
  void getDropdownFrom() {
    setState(() {
      holderFrom = valueFrom;
    });
  }

  //for "when" variables
  String holderWhen = ""; //holds the final value for when
  var valueWhen = null;

  //getting the data from when dropdown
  void getDropdownWhen() {
    setState(() {
      holderWhen = valueWhen;
    });
  }

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
        //onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                              text: "hotel",
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

                        //--- for where are u going
                        DropdownButton<String>(
                          value: valueGo,
                          hint: Text("   Where are you going?"),
                          icon: Icon(Icons.arrow_drop_down),
                          onChanged: (String? data) {
                            setState(() {
                              valueGo = data!;
                            });
                          },
                          items: dropdownGo.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        //-----

                        SizedBox(height: 10),

                        //--- for where are u gonna come from
                        DropdownButton<String>(
                          value: valueFrom,
                          hint: Text("   Where are you gonna come from?"),
                          icon: Icon(Icons.arrow_drop_down),
                          onChanged: (String? data) {
                            setState(() {
                              valueFrom = data!;
                            });
                          },
                          items: <String>['   Manila, Philippines']
                              .map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        //-----

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

                        //--- for when are u going
                        DropdownButton<String>(
                          value: valueWhen,
                          hint: Text("    When are you going?"),
                          icon: Icon(Icons.arrow_drop_down),
                          onChanged: (String? data) {
                            setState(() {
                              valueWhen = data!;
                            });
                          },
                          items: dropdownWhen.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        //-----

                        SizedBox(height: 10),

                        //----for whos coming
                        TextFormField(
                          controller: _who,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline_outlined),
                            fillColor: Colors.white54,
                            filled: true,
                            labelText: "Who's coming? Separate with a comma.",
                          ),
                        ),
                        //------------

                        SizedBox(height: 10),

                        //for how many
                        TextFormField(
                          controller: _howMany,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_add_alt_1),
                            fillColor: Colors.white54,
                            filled: true,
                            labelText: 'How many are coming?',
                          ),
                        ),
                        //----------------

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

                        //for assist requirements
                        TextFormField(
                          controller: _kindAssist,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.sick),
                            fillColor: Colors.white54,
                            filled: true,
                            labelText: 'What assistance do they require?',
                          ),
                        ),
                        //---------------

                        SizedBox(height: 25),

                        Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      showAlertDialog(context);
                                    },
                                    child: Text('Submit',
                                        style: TextStyle(fontSize: 20)))),
                          ],
                        ),
                        SizedBox(height: 10),
                      ]))
                    ])))),
      );

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        getDropdownFrom();
        getDropdownGo();
        getDropdownOneWay();
        getDropdownPersonal();
        getDropdownWhen();

        Navigator.of(context)
            .push(MaterialPageRoute(
                builder: (context) => Ticket.hello(
                    going: holderGo,
                    from: holderFrom,
                    howMany: _howMany.text,
                    kindAssist: _kindAssist.text,
                    oneWay: holderOneWay,
                    perAssist: holderPersonal,
                    when: holderWhen,
                    who: _who.text)))
            .then((value) {
          //_from.clear();
          //_going.clear();
          _howMany.clear();
          _kindAssist.clear();
          _who.clear();
          Navigator.of(context).pop();
          //_when.clear();
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirmation"),
      content: Text("Have you double checked your information?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
