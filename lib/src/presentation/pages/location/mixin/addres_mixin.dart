import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../pages/location_page.dart';

mixin AddressMixin on State<LocationPage>{
  late  TextEditingController entranceController;
  late  TextEditingController floorController;
  late  TextEditingController apartController;
  late  TextEditingController locationController;
}