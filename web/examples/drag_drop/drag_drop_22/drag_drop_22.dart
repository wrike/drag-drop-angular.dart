import 'package:angular2/angular2.dart';

import '../../common.dart';

@Component(
  selector: 'drag-drop-example-22',
  templateUrl: 'drag_drop_22.html',
  styleUrls: const ['drag_drop_22.css'],
  directives: const [
    CORE_DIRECTIVES,
    DRAG_DROP_DIRECTIVES,
    BasketComponent,
    FruitComponent
  ]
)
class DragDropExample22Component {

  final FruitFactory fruits;
  final ExampleEventsHandler handler;
  final Basket<FruitModel> basket = new Basket<FruitModel>();


  DragOptions dragOptions = new DragOptions(
    selector: 'fruit-component'
  );

  DropOptions dropOptions = new DropOptions(
    selector: '.fruit-wrapper',
    canEnter: (DragSource source) => source.model is FruitModel
  );

  DragDropExample22Component(this.fruits, this.handler) {
    basket.addAll(fruits.getFruits(7));
  }

  MovementDirection _movementDirection;
  bool get movingLeft => _movementDirection?.x == MovementDirectionType.negative;
  bool get movingRight => _movementDirection?.x == MovementDirectionType.positive;

  void onDragOver(DragOverEvent event) {
    _movementDirection = event.movement.direction;
  }

  void onDrop(DropEvent event) {
    FruitModel fruit = event.source.model;
    FruitModel anchorFruit = event.target.model;

    basket.items.remove(fruit);
    int pos = basket.items.indexOf(anchorFruit);
    if (movingRight) {
      pos++;
    }
    basket.items.insert(pos, fruit);
  }

}
