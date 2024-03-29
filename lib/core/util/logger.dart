import 'package:logging/logging.dart';
import 'dart:developer' as developer;

void loggerConfigure() {
 Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    developer.log('${record.level.name}: ${record.time}: ${record.message}');
  });
}

final log = Logger('ApiRetrofit');
