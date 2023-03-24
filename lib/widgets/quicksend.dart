// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet_app/Model/Catalog.dart';
import 'package:wallet_app/widgets/dimensions.dart';
import 'package:wallet_app/Screens/peoples.dart';

import 'package:wallet_app/widgets/responsive_helpe.dart';

class Quicksend extends StatefulWidget {
  @override
  State<Quicksend> createState() => _QuicksendState();
}

class _QuicksendState extends State<Quicksend> {
  @override
  List<People> peopleinQuicksend = [];

  void initState() {
    peopleinQuicksend = CatalogModel.peoples;

    super.initState();
    loadData();
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
      peopleinQuicksend = CatalogModel.peoples;
    });
  }

  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) =>
          SizedBox(width: ResponsiveHelper.responsiveWidth(5)),
      itemCount: peopleinQuicksend.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => CircleavtarPeople(
        people: peopleinQuicksend[index],
      ),
    );
  }
}

class CircleavtarPeople extends StatelessWidget {
  final People people;
  const CircleavtarPeople({Key? key, required this.people}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PeoplesPage(people: people),
                ),
              );
            },
            child: Container(
              height: ResponsiveHelper.responsiveHeight(70),
              width: ResponsiveHelper.responsiveWidth(70),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(people.image), fit: BoxFit.cover),
                // borderRadius: BorderRadius.all(
                //     Radius.circular(ResponsiveHelper.responsiveWidth(70))),
              ),
            ),
          ),
          SizedBox(
            height: ResponsiveHelper.responsiveHeight(5),
          ),
          SizedBox(
            width: 70,
            child: Padding(
              padding:
                  EdgeInsets.only(left: ResponsiveHelper.responsiveWidth(15)),
              child: Text(
                people.name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
