import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/Screens/SendmonyPage.dart';
import 'package:wallet_app/Screens/requestpage.dart';
import 'package:wallet_app/widgets/dimensions.dart';
import 'package:wallet_app/Screens/peoples.dart';
import 'package:wallet_app/widgets/responsive_helpe.dart';

class ButtonContainer extends StatelessWidget {
  final String buttonText;
  final TextColor;
  final color;
  const ButtonContainer({
    Key? key,
    required this.buttonText,
    required this.color,
    required this.TextColor,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SendMoneyPage()));
      },
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: TextColor),
          ),
        ),
        height: ResponsiveHelper.responsiveHeight(60),
        width: ResponsiveHelper.responsiveWidth(120),
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(ResponsiveHelper.responsiveWidth(30)),
            color: color),
      ),
    );
  }
}
