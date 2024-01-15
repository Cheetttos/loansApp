import 'dart:developer';

import 'package:flutter/foundation.dart';

appLogger(dynamic data) {
  if (kDebugMode) {
    log(data.toString());
  }
}
