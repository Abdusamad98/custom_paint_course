import 'package:flutter/material.dart';

Widget myButton(VoidCallback onTap) => Container(
      margin: const EdgeInsets.all(16),
      child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(backgroundColor: Colors.red),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              //color: Colors.blue,
              borderRadius: BorderRadius.circular(32),
            ),
            child: const Center(
              child: Text(
                "Task screen",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )),
    );
