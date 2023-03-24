// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:wallet_app/Model/Catalog.dart';
import 'package:wallet_app/Screens/MyPeopleMoneyPage.dart';
import 'package:wallet_app/widgets/responsive_helpe.dart';

class PeopleWidget extends StatelessWidget {
  final People people;
  const PeopleWidget({Key? key, required this.people}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MyPeopleMoneyPage(
              people: people,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(ResponsiveHelper.responsiveWidth(10)),
          color: Colors.grey.shade700,
        ),
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: ResponsiveHelper.responsiveWidth(30),
                backgroundImage: AssetImage(people.image),
              ),
              SizedBox(width: ResponsiveHelper.responsiveWidth(10)),
              Text(people.name),
            ],
          ),
        ),
      ),
    );
  }
}
