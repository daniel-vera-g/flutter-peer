import 'package:flutter/material.dart';

showLoadingDialog(context, title) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: ListTile(
              leading: CircularProgressIndicator(),
              title: Text(title),
            ),
          ));
}
