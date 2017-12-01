import 'package:angular2/angular2.dart';

import '../../common.dart';


@Component(
  selector: 'drag-drop-example-17',
  templateUrl: 'drag_drop_17.html',
  styleUrls: const ['drag_drop_17.css'],
  directives: const [
    CORE_DIRECTIVES,
    DRAG_DROP_DIRECTIVES,
    BasketComponent,
    FruitComponent
  ]
)
class DragDropExample17Component {

  final FruitFactory fruits;
  final ExampleEventsHandler handler;
  final Basket<FruitModel> basket1 = new Basket<FruitModel>();
  final Basket<FruitModel> basket2 = new Basket<FruitModel>();

  DragOptions dragOptions = new DragOptions(
    selector: 'fruit-component'
  );

  DropOptions dropOptions = new DropOptions(
    selector: 'fruit-component',
    canDrop: (DragSource source, DropTarget target) {
      if (source.container == target.container) {
        return false;
      }
      return (source.model as FruitModel).type == (target.model as FruitModel).type;
    }
  );

  DragDropExample17Component(this.fruits, this.handler) {
    basket1.addAll(fruits.getFruits(7));
    basket2.addAll(fruits.getFruits(7));
  }

  void onDrop(DropEvent event) => handler.onDrop(event);

}
