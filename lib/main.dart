import 'package:calculadora_imc/my_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.macOS
    ){
    sqfliteFfiInit();
    sql.databaseFactory = databaseFactoryFfi;
  }

  runApp(const MyApp());
}