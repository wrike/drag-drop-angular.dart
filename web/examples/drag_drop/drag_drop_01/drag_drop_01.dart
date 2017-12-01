import 'package:angular2/angular2.dart';

import '../../common.dart';

@Component(
  selector: 'drag-drop-example-01',
  templateUrl: 'drag_drop_01.html',
  styleUrls: const ['drag_drop_01.css'],
  directives: const [
    CORE_DIRECTIVES,
    DRAG_DROP_DIRECTIVES,
    BasketComponent,
    FruitComponent
  ]
)
class DragDropExample01Component {

  final FruitFactory fruits;
  final ExampleEventsHandler handler;
  final Basket<FruitModel> basket = new Basket<FruitModel>();

  DragOptions dragOptions = new DragOptions(
    selector: 'fruit-component'
  );

  DragDropExample01Component(this.fruits, this.handler) {
    basket.addAll(fruits.getFruits(7));
  }

  void onDragStart(DragStartEvent event) => handler.onDragStart(event);
  void onDragEnd(DragEndEvent event) => handler.onDragEnd(event);

}
