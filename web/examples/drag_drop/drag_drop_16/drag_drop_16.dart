import 'package:angular2/angular2.dart';

import '../../common.dart';


@Component(
  selector: 'drag-drop-example-16',
  templateUrl: 'drag_drop_16.html',
  styleUrls: const ['drag_drop_16.css'],
  directives: const [
    CORE_DIRECTIVES,
    DRAG_DROP_DIRECTIVES,
    BasketComponent,
    FruitComponent
  ]
)
class DragDropExample16Component {

  final FruitFactory fruits;
  final ExampleEventsHandler handler;

  final Basket<FruitModel> basket1 = new Basket<FruitModel>();
  final Basket<FruitModel> basket2 = new Basket<FruitModel>();
  final Basket<FruitModel> basket3 = new Basket<FruitModel>();

  DragOptions dragOptions = new DragOptions(
    selector: 'fruit-component'
  );

  DropOptions dropOptionsOrange = new DropOptions(
    canEnter: ((DragSource source) {
      FruitModel fruit = source.model as FruitModel;
      return fruit.type == FruitType.orange;
    })
  );

  DropOptions dropOptionsPlum = new DropOptions(
    canEnter: ((DragSource source) {
      FruitModel fruit = source.model as FruitModel;
      return fruit.type == FruitType.plum;
    })
  );

  DragDropExample16Component(this.fruits, this.handler) {
    basket1.addAll(fruits.getFruits(7));
    basket1.add(fruits.getPlum());

    basket2.addAll(fruits.getFruits(7));
    basket2.add(fruits.getOrange());
  }

  void onDragStart(DragStartEvent event) => handler.onDragStart(event);
  void onDragEnter(DragEnterEvent event) => handler.onDragEnter(event);
  void onDragLeave(DragLeaveEvent event) => handler.onDragLeave(event);
  void onDragEnd(DragEndEvent event) => handler.onDragEnd(event);
  void onDrop(DropEvent event) => handler.onDrop(event);

}
