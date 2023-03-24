// ignore_for_file: file_names, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet_app/Screens/Homescreen.dart';

import 'package:wallet_app/widgets/Buttom_Navigation_bar.dart';
import 'package:wallet_app/Model/Catalog.dart';
import 'package:wallet_app/Screens/SendmonyPage.dart';
import 'package:wallet_app/controllers/DBhelper.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

import '../widgets/responsive_helpe.dart';

class MyPeopleMoneyPage extends StatefulWidget {
  final People people;

  const MyPeopleMoneyPage({Key? key, required this.people}) : super(key: key);

  @override
  State<MyPeopleMoneyPage> createState() => _MyPeopleMoneyPageState();
}

class _MyPeopleMoneyPageState extends State<MyPeopleMoneyPage> {
  final formKey = GlobalKey<FormState>();
  int? amount;

  String type = "Send";

  DateTime selectedDate = DateTime.now();
  String? image;

  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "july",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  Future<void> _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2021, 12),
        lastDate: DateTime(2023, 12));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Transfering")),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BottomNavigation()));
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: ResponsiveHelper.responsiveHeight(100),
              width: ResponsiveHelper.responsiveWidth(100),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(widget.people.image), fit: BoxFit.cover),
                // borderRadius: BorderRadius.all(
                //     Radius.circular(ResponsiveHelper.responsiveWidth(70))),
              ),
            ),
            Text(widget.people.name,
                style: TextStyle(
                  fontSize: 15,
                )),
            // Text(people.account_no,
            //     style: TextStyle(color: Colors.white70)),
            SizedBox(height: ResponsiveHelper.responsiveHeight(10)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'amount needed!!';
                    }
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.attach_money),
                      hintText: "Enter amount",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              ResponsiveHelper.responsiveWidth(20)))),
                  onChanged: (value) {
                    try {
                      amount = int.parse(value);
                    } catch (e) {}
                  },
                ),
              ),
            ),
            SizedBox(height: ResponsiveHelper.responsiveHeight(10)),
            Padding(
              padding:
                  EdgeInsets.only(left: ResponsiveHelper.responsiveWidth(15)),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_view_month,
                  ),
                  TextButton(
                    onPressed: () {
                      _selectedDate(context);
                    },
                    child: Text(
                        "${selectedDate.day} ${months[selectedDate.month - 1]}"),
                  ),
                  SizedBox(width: ResponsiveHelper.responsiveWidth(10)),
                  Text(
                    "You can choose a date",
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: ResponsiveHelper.responsiveHeight(20)),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ConfirmationSlider(
                  foregroundColor: Colors.green,
                  backgroundColor: Colors.grey.shade100,
                  text: " Slide to send ",
                  textStyle: TextStyle(color: Colors.blueGrey),
                  onConfirmation: () async {
                    setState(() {
                      if (formKey.currentState!.validate()) {}
                      type = "Send";
                    });
                    if (amount != null) {
                      DbHelper dbhelper = DbHelper();
                      await dbhelper.addData(
                        amount!,
                        selectedDate,
                        type,
                      );
                      Navigator.of(context).pop();
                    } else {
                      print("amount needed");
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ConfirmationSlider(
                  foregroundColor: Colors.green,
                  backgroundColor: Colors.grey.shade100,
                  text: " Slide to request ",
                  textStyle: TextStyle(color: Colors.blueGrey),
                  onConfirmation: () async {
                    setState(() {
                      if (formKey.currentState!.validate()) {}
                      type = "Request";
                    });

                    if (amount != null) {
                      DbHelper dbhelper = DbHelper();
                      await dbhelper.addData(amount!, selectedDate, type);
                      Navigator.of(context).pop();
                    } else {
                      print("amount needed");
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
