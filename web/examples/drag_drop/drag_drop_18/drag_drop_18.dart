import 'package:angular2/angular2.dart';

import '../../common.dart';

@Component(
  selector: 'drag-drop-example-18',
  templateUrl: 'drag_drop_18.html',
  styleUrls: const ['drag_drop_18.css'],
  directives: const [
    CORE_DIRECTIVES,
    DRAG_DROP_DIRECTIVES,
    BasketComponent,
    FruitComponent
  ]
)
class DragDropExample18Component {

  final FruitFactory fruits;
  final Basket<FruitModel> basket = new Basket<FruitModel>();

  DragOptions dragOptions = new DragOptions(
    selector: 'fruit-component'
  );

  DropOptions dropOptions = new DropOptions(
    selector: 'fruit-component',
    canDrop: (DragSource source, DropTarget target) => source.container != target.container
  );

  bool isOver = false;
  MovementDetails _movementDetails;
  Point get position => _movementDetails?.position ?? const Point(0, 0);

  String get direction {
    MovementDirectionType dirX = _movementDetails.direction.x;
    MovementDirectionType dirY = _movementDetails.direction.y;
    String dir = '';
    if (dirX == MovementDirectionType.positive) {
      dir += 'right';
    } else if (dirX == MovementDirectionType.negative) {
      dir += 'left';
    }
    if (dirY == MovementDirectionType.positive) {
      dir += ' down';
    } else if (dirY == MovementDirectionType.negative) {
      dir += ' up';
    }
    return dir.trim();
  }

  DragDropExample18Component(this.fruits) {
    basket.addAll(fruits.getFruits(7));
  }

  void onDragEnd(DragEndEvent event) {
    isOver = false;
  }

  void onDragOver(DragOverEvent event) {
    isOver = event.source.model != event.target.model;
    _movementDetails = event.movement;
  }

}
