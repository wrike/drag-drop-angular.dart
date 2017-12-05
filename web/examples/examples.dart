import 'package:angular2/angular2.dart';

import 'common.dart';
import 'drag_drop/drag_drop_01/drag_drop_01.dart';
import 'drag_drop/drag_drop_02/drag_drop_02.dart';
import 'drag_drop/drag_drop_03/drag_drop_03.dart';
import 'drag_drop/drag_drop_04/drag_drop_04.dart';
import 'drag_drop/drag_drop_05/drag_drop_05.dart';
import 'drag_drop/drag_drop_06/drag_drop_06.dart';
import 'drag_drop/drag_drop_07/drag_drop_07.dart';
import 'drag_drop/drag_drop_08/drag_drop_08.dart';
import 'drag_drop/drag_drop_09/drag_drop_09.dart';
import 'drag_drop/drag_drop_10/drag_drop_10.dart';
import 'drag_drop/drag_drop_11/drag_drop_11.dart';
import 'drag_drop/drag_drop_12/drag_drop_12.dart';
import 'drag_drop/drag_drop_13/drag_drop_13.dart';
import 'drag_drop/drag_drop_14/drag_drop_14.dart';
import 'drag_drop/drag_drop_15/drag_drop_15.dart';
import 'drag_drop/drag_drop_16/drag_drop_16.dart';
import 'drag_drop/drag_drop_17/drag_drop_17.dart';
import 'drag_drop/drag_drop_18/drag_drop_18.dart';
import 'drag_drop/drag_drop_19/drag_drop_19.dart';
import 'drag_drop/drag_drop_20/drag_drop_20.dart';
import 'drag_drop/drag_drop_21/drag_drop_21.dart';

@Component(
  preserveWhitespace: false,
  selector: 'div.drag-drop-examples',
  templateUrl: 'examples.html',
  styleUrls: const ['examples.css'],
  providers: const [
    DRAG_DROP_PROVIDERS,
    FruitFactory,
    ExampleEventsHandler
  ],
  directives: const [
    DragDropExample01Component,
    DragDropExample02Component,
    DragDropExample03Component,
    DragDropExample04Component,
    DragDropExample05Component,
    DragDropExample06Component,
    DragDropExample07Component,
    DragDropExample08Component,
    DragDropExample09Component,
    DragDropExample10Component,
    DragDropExample11Component,
    DragDropExample12Component,
    DragDropExample13Component,
    DragDropExample14Component,
    DragDropExample15Component,
    DragDropExample16Component,
    DragDropExample17Component,
    DragDropExample18Component,
    DragDropExample19Component,
    DragDropExample20Component,
    DragDropExample21Component
  ]
)
class ExamplesComponent {
}
