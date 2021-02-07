import 'package:flutter/material.dart';
import 'package:geo_weather/ui/utils/theme.dart';

labelWithIcon(IconData icon, String label, String text) {
  return Card(
      color: oxfordBlue,
      child: ListTile(
          leading: Icon(
            icon,
            color: bittersweet,
          ),
          title: Text(
            "$label:",
            style: TextStyle(
                color: bittersweet, fontSize: 20, fontWeight: FontWeight.w900),
          ),
          trailing: Text(
            text,
            style: TextStyle(
                color: bittersweet, fontSize: 20, fontWeight: FontWeight.w900),
          )));
}
