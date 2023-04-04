import 'dart:ui';

import 'package:intl/intl.dart';

String dateFormatter(String date){
  final DateTime parsed = DateTime.parse(date);
  return DateFormat.Hm().format(parsed);
}