// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet_app/widgets/Buttom_Navigation_bar.dart';
import 'package:wallet_app/Model/Catalog.dart';
// ignore: unused_import
import 'package:wallet_app/Screens/Homescreen.dart';
import 'dart:convert';

import 'package:wallet_app/widgets/PeopleWidget.dart';

import '../widgets/responsive_helpe.dart';

class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({Key? key}) : super(key: key);

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  List<People> _foundUsers = [];

  void initState() {
    _foundUsers = CatalogModel.peoples;

    super.initState();
    loadData();
  }

  void _filterSearch(String enteredkeyword) {
    List<People> results = [];

    if (enteredkeyword.isEmpty) {
      results = CatalogModel.peoples;
    } else {
      results = (CatalogModel.peoples
          .where((people) =>
              people.name.toLowerCase().contains(enteredkeyword.toLowerCase()))
          .toList());
    }
    setState(() {
      _foundUsers = results;
    });
  }

  loadData() async {
    final peoplesJson =
        await rootBundle.loadString("assets/files/peoples.json");
    final decodedData = jsonDecode(peoplesJson);
    var peoplesData = decodedData["peoples"];
    CatalogModel.peoples = List.from(peoplesData)
        .map<People>((people) => People.fromMap(people))
        .toList();

    setState(() {
      _foundUsers = CatalogModel.peoples;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BottomNavigation()));
              },
              icon: Icon(Icons.arrow_back_ios)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Center(
            child: Text(
              "Send Money",
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
              top: ResponsiveHelper.responsiveHeight(10),
              right: ResponsiveHelper.responsiveWidth(10),
              left: ResponsiveHelper.responsiveWidth(10)),
          child: Column(
            children: [
              TextField(
                onChanged: (value) => _filterSearch(value),
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Search",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.green,
                  ),
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.responsiveHeight(15),
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: (_foundUsers != null && _foundUsers.isNotEmpty)
                        ? ListView.builder(
                            itemBuilder: (context, index) {
                              return PeopleWidget(
                                people: _foundUsers[index],
                              );
                            },
                            itemCount: _foundUsers.length,
                          )
                        : Center(
                            child: Text("No user found.."),
                          )),
              )
            ],
          ),
        ));
  }
}
