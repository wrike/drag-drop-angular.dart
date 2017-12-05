import 'package:angular2/angular2.dart';

import '../../common.dart';


@Component(
  selector: 'drag-drop-example-03',
  templateUrl: 'drag_drop_03.html',
  styleUrls: const ['drag_drop_03.css'],
  directives: const [
    CORE_DIRECTIVES,
    DRAG_DROP_DIRECTIVES,
    BasketComponent,
    FruitComponent
  ]
)
class DragDropExample03Component {

  final FruitFactory fruits;
  final ExampleEventsHandler handler;
  final Basket<FruitModel> basket = new Basket<FruitModel>();

  DragOptions dragOptions = new DragOptions(
    selector: 'fruit-component',
    handleSelector: '.worm-hole'
  );

  DragDropExample03Component(this.fruits, this.handler) {
    basket.addAll(fruits.getFruits(7));
  }

  void onDragStart(DragStartEvent event) => handler.onDragStart(event);
  void onDragEnd(DragEndEvent event) => handler.onDragEnd(event);
}
