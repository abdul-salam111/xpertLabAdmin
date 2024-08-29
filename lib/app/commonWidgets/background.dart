import 'package:flutter/material.dart';

import '../../appConst/index.dart';

Widget backgroundWidget({required Widget child}) {
  return Container(
    decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                bgimg,
              ),
              opacity: 0.4,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.dstATop))),
    child: child);
}
