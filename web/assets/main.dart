import 'package:angular2/platform/browser.dart';
import 'package:logging/logging.dart' as log;

import '../examples/examples.dart';

void main() {
  log.hierarchicalLoggingEnabled = true;
  log.Logger.root.level = log.Level.ALL;
  log.Logger.root.onRecord.listen((log.LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  log.Logger.root.info("AngularDart DragDrop demo application run");
  bootstrap(ExamplesComponent, []);
}

