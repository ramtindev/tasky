import 'package:flutter/material.dart';

Widget BuildCircleIcons(colors , icon){
  return  Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: colors,
                          borderRadius: BorderRadius.circular(300),
                        ),
                        child: Icon(
                         icon,
                          color: Colors.white,
                        ),
                      );
}