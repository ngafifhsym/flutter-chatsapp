import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String dateFormatter(int date){
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(date);
  return DateFormat.Hm().format(dateTime);
}