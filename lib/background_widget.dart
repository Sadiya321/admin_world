

import 'package:admin_world/const/images.dart';
import 'package:flutter/material.dart';

Widget bgWidget({
  Widget? child,
}) {
    return Container(
       decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(background),
        fit: BoxFit.cover,
      ),
    ),child: child,
    );
  }