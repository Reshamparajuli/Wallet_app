// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:wallet_app/Screens/Homescreen.dart';
// import 'package:wallet_app/controllers/DBhelper.dart';
// import 'package:wallet_app/quicksend.dart';
// import 'package:wallet_app/responsive_helpe.dart';

// class RequestPage extends StatefulWidget {
//   final PeopleDetail man;

//   const RequestPage({Key? key, required this.man}) : super(key: key);

//   @override
//   State<RequestPage> createState() => _RequestPageState();
// }

// class _RequestPageState extends State<RequestPage> {
//   int? amount = 0;
//   int? date;
//   DateTime selectedDate = DateTime.now();

//   List<String> months = [
//     "Jan",
//     "Feb",
//     "Mar",
//     "Apr",
//     "May",
//     "Jun",
//     "july",
//     "Aug",
//     "Sep",
//     "Oct",
//     "Nov",
//     "Dec",
//   ];

//   Future<void> _selectedDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: selectedDate,
//         firstDate: DateTime(2021, 12),
//         lastDate: DateTime(2023, 12));
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text("Request")),
//         leading: GestureDetector(
//             onTap: () {
//               Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (context) => HomePage()));
//             },
//             child: Icon(Icons.arrow_back)),
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               height: ResponsiveHelper.responsiveHeight(100),
//               width: ResponsiveHelper.responsiveWidth(100),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                     image: AssetImage(widget.man.image), fit: BoxFit.cover),
//                 // borderRadius: BorderRadius.all(
//                 //     Radius.circular(ResponsiveHelper.responsiveWidth(70))),
//               ),
//             ),
//             Text(widget.man.name,
//                 style: TextStyle(
//                   fontSize: 15,
//                 )),
//             Text(widget.man.account_no,
//                 style: TextStyle(color: Colors.white70)),
//             SizedBox(height: ResponsiveHelper.responsiveHeight(10)),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 inputFormatters: [
//                   FilteringTextInputFormatter.digitsOnly,
//                 ],
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                     icon: Icon(Icons.attach_money),
//                     hintText: "Enter amount you want to request",
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(
//                             ResponsiveHelper.responsiveWidth(20)))),
//                 onChanged: (value) {
//                   try {
//                     amount = int.parse(value);
//                   } catch (e) {}
//                 },
//               ),
//             ),
//             SizedBox(height: ResponsiveHelper.responsiveHeight(10)),
//             Padding(
//               padding:
//                   EdgeInsets.only(left: ResponsiveHelper.responsiveWidth(15)),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.calendar_view_month,
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       _selectedDate(context);
//                     },
//                     child: Text(
//                         "${selectedDate.day} ${months[selectedDate.month - 1]}"),
//                   ),
//                   SizedBox(width: ResponsiveHelper.responsiveWidth(10)),
//                   Text(
//                     "You can choose a date",
//                     style: TextStyle(
//                       color: Colors.purple,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(height: ResponsiveHelper.responsiveHeight(20)),
//             SizedBox(
//               height: ResponsiveHelper.responsiveHeight(50),
//               child: ElevatedButton(
//                   onPressed: () async {
//                     if (amount != null) {
//                       DbHelper dbhelper = DbHelper();
//                       await dbhelper.addData(amount!, selectedDate);
//                       Navigator.of(context).pop();
//                     } else {
//                       print("amount needed");
//                     }
//                   },
//                   child: Text("Request From " + widget.man.name)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
