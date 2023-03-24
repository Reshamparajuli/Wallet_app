// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wallet_app/Screens/request_button.dart';
import 'package:wallet_app/controllers/DBhelper.dart';

import 'package:wallet_app/widgets/quicksend.dart';
import 'package:wallet_app/widgets/responsive_helpe.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DbHelper dbhelper = DbHelper();
  static int totalBalance = 0;

  getTotalBalance(Map entireData) {
    totalBalance = 0;

    entireData.forEach((key, value) {
      if (value['type'] == "Send") {
        if (value['amount'] > totalBalance) {
          print('notbalance');
        } else {
          totalBalance -= (value['amount'] as int);
          print(value['amount']);
        }
      } else {
        totalBalance += (value['amount'] as int);
      }
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<Map>(
            future: dbhelper.fetch(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                getTotalBalance(snapshot.data!);

                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(
                                ResponsiveHelper.responsiveWidth(40))),
                            color: Colors.green,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: ResponsiveHelper.responsiveHeight(10),
                                left: ResponsiveHelper.responsiveWidth(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.menu_open)),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: ResponsiveHelper
                                                  .responsiveHeight(12)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Good morning",
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: ResponsiveHelper
                                                      .responsiveHeight(15),
                                                ),
                                              ),
                                              Text(
                                                "Resham",
                                                style: TextStyle(
                                                  color: Colors.grey[200],
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: ResponsiveHelper
                                                      .responsiveHeight(20),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.notifications,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: ResponsiveHelper.responsiveHeight(5),
                                ),
                                Text(
                                  "Your total balance",
                                  style: TextStyle(
                                    fontSize:
                                        ResponsiveHelper.responsiveHeight(20),
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  "\$$totalBalance",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        ResponsiveHelper.responsiveHeight(30),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: ResponsiveHelper.responsiveHeight(14),
                                ),
                                Row(
                                  children: [
                                    ButtonContainer(
                                        buttonText: 'request',
                                        TextColor: Colors.white,
                                        color: Colors.black),
                                    SizedBox(
                                      width:
                                          ResponsiveHelper.responsiveWidth(14),
                                    ),
                                    ButtonContainer(
                                        buttonText: 'send',
                                        TextColor: Colors.black,
                                        color: Colors.white),
                                  ],
                                ),
                                SizedBox(
                                  height: ResponsiveHelper.responsiveHeight(14),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: ResponsiveHelper.responsiveHeight(14)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ResponsiveHelper.responsiveWidth(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Quick send",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        ResponsiveHelper.responsiveHeight(13),
                                    color: Colors.white),
                              ),
                              Text(
                                "View all",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize:
                                      ResponsiveHelper.responsiveHeight(13),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: ResponsiveHelper.responsiveHeight(10)),

                        //circle avtar people
                        Container(
                          height: ResponsiveHelper.responsiveHeight(120),
                          child: Quicksend(),
                        ),

                        SizedBox(height: ResponsiveHelper.responsiveHeight(5)),

                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ResponsiveHelper.responsiveWidth(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "History",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        ResponsiveHelper.responsiveHeight(13),
                                    color: Colors.white),
                              ),
                              Text(
                                "View all",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize:
                                      ResponsiveHelper.responsiveHeight(13),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: ResponsiveHelper.responsiveHeight(4)),

                        SizedBox(
                            child: FutureBuilder<Map>(
                                future: dbhelper.fetch(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    if (snapshot.data!.isEmpty) {
                                      return SizedBox(
                                        height:
                                            ResponsiveHelper.responsiveHeight(
                                                120),
                                        child: Center(
                                            child:
                                                Text("No transaction found")),
                                      );
                                    }
                                    getTotalBalance(snapshot.data!);
                                    return (ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          Map dataAtindex =
                                              snapshot.data![index];
                                          if (dataAtindex['type'] == "Send") {
                                            return Send(
                                              dataAtindex['amount'],
                                              dataAtindex['date'],
                                            );
                                          } else {
                                            return Request(
                                                dataAtindex['amount'],
                                                dataAtindex['date']);
                                          }
                                        }));
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                })),
                      ],
                    ),
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }

  Widget Send(
    int value,
    DateTime selectedDate,
  ) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(ResponsiveHelper.responsiveWidth(20)),
          color: Colors.grey.shade900),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/send.png"),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Send",
                style: TextStyle(color: Colors.red),
              ),
              Text("${selectedDate.day} ${months[selectedDate.month - 1]}",
                  style: TextStyle(color: Colors.grey.shade400))
            ],
          ),
          Text("-$value", style: TextStyle(color: Colors.red)),
          Icon(
            Icons.arrow_circle_up_outlined,
            color: Colors.red,
          )
        ],
      ),
    );
  }

  Widget Request(
    int value,
    DateTime selectedDate,
  ) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(ResponsiveHelper.responsiveWidth(20)),
          color: Colors.grey.shade900),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/income.png"),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Income",
                style: TextStyle(color: Colors.green),
              ),
              Text("${selectedDate.day} ${months[selectedDate.month - 1]}",
                  style: TextStyle(color: Colors.grey.shade400))
            ],
          ),
          Text("+$value", style: TextStyle(color: Colors.green)),
          Icon(Icons.arrow_circle_down_outlined, color: Colors.green)
        ],
      ),
    );
  }
}
