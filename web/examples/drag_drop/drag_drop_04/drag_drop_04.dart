import 'package:angular2/angular2.dart';

import '../../common.dart';


@Component(
  selector: 'drag-drop-example-04',
  templateUrl: 'drag_drop_04.html',
  styleUrls: const ['drag_drop_04.css'],
  directives: const [
    CORE_DIRECTIVES,
    DRAG_DROP_DIRECTIVES,
    BasketComponent,
    FruitComponent
  ]
)
class DragDropExample04Component {

  final FruitFactory fruits;
  final ExampleEventsHandler handler;

  DragOptions dragOptions = new DragOptions();
  List<FruitModel> dragFruits = <FruitModel>[];

  DragDropExample04Component(this.fruits, this.handler) {
    dragFruits.addAll(fruits.getFruits(7));
  }

  void onDragStart(DragStartEvent event) => handler.onDragStart(event);
  void onDragEnd(DragEndEvent event) => handler.onDragEnd(event);

}
