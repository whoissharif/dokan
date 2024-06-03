import 'package:flutter/material.dart';

extension SizeExtention on int {
  SizedBox get hs => SizedBox(height: toDouble());
  SizedBox get ws => SizedBox(width: toDouble());
}