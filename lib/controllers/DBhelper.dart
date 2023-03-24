// ignore_for_file: non_constant_identifier_names, file_names

import 'package:hive/hive.dart';

class DbHelper {
  late Box box;

  DbHelper() {
    openBox();
  }
  openBox() {
    box = Hive.box('money');
  }

  Future addData(int amount, DateTime selectedDate, String type) async {
    var value = {
      'amount': amount,
      'date': selectedDate,
      'type': type,
    };
    box.add(value);
  }

  Future<Map> fetch() {
    if (box.values.isEmpty) {
      return Future.value({});
    } else {
      return Future.value(box.toMap());
    }
  }
}
