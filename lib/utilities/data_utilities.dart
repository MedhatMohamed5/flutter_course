import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

Widget loading() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 16),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget noData() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 16),
    child: Center(
      child: Text('No data available!'),
    ),
  );
}

Widget connectionError() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 16),
    child: Center(
      child: Text('Connection Error!'),
    ),
  );
}

Widget error(var e) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 16),
    child: Center(
      child: Text(e.toString()),
    ),
  );
}
String parseDate(String date) {
  return timeago.format(DateTime.parse(date));
}

