import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class UtilsServices {

  final storage = const FlutterSecureStorage();

//Save data local safety
  Future<void> saveLocalData({
    required String key, required String data
  }) async {
    await storage.write(key: key, value: data);
  }

  //Truy xuat du lieu da luu
  Future<String?> getLocalData({required String key}) async {
    return await storage.read(key: key);
  }

  //Remove data saved local
  Future<void> removeLocalData({required String key}) async {
    await storage.delete(key: key);
  }

  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(price);
  }

  String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();

    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormat.format(dateTime);
  }

  void showToast({required String message, bool isError = false}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: isError ?Colors.red : Colors.white,
        textColor: isError ?Colors.white : Colors.black,
        fontSize: 16.0
    );
  }
}