import 'package:angular2/angular2.dart';

import '../../common.dart';

@Component(
  selector: 'drag-drop-example-14',
  templateUrl: 'drag_drop_14.html',
  styleUrls: const ['drag_drop_14.css'],
  directives: const [
    CORE_DIRECTIVES,
    DRAG_DROP_DIRECTIVES,
    BasketComponent,
    FruitComponent
  ]
)
class DragDropExample14Component {

  final FruitFactory fruits;
  final ExampleEventsHandler handler;
  final DragDropModelStorage storage;
  final Basket<FruitModel> basket1 = new Basket<FruitModel>();
  final Basket<FruitModel> basket2 = new Basket<FruitModel>();

  DragOptions dragOptions = new DragOptions(
    selector: 'fruit-component'
  );

  DropOptions dropOptions = new DropOptions();

  DragDropExample14Component(this.fruits, this.handler, this.storage) {
    basket1.addAll(fruits.getFruits(7));
    basket2.addAll(fruits.getFruits(7));
  }

  void onDragStart(DragStartEvent event) => handler.onDragStart(event);
  void onDragEnter(DragEnterEvent event) => handler.onDragEnter(event);
  void onDragLeave(DragLeaveEvent event) => handler.onDragLeave(event);
  void onDragEnd(DragEndEvent event) => handler.onDragEnd(event);
  void onDrop(DropEvent event) => handler.onDrop(event);

}
