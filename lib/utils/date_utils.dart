import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String dateFormatter(Timestamp date){
  return DateFormat.Hm().format(date.toDate());
}