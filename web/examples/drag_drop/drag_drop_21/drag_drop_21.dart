import 'package:angular2/angular2.dart';

import '../../common.dart';

@Component(
  selector: 'drag-drop-example-21',
  templateUrl: 'drag_drop_21.html',
  styleUrls: const ['drag_drop_21.css'],
  directives: const [
    CORE_DIRECTIVES,
    DRAG_DROP_DIRECTIVES,
    BasketComponent,
    FruitComponent
  ]
)
class DragDropExample21Component {

  final FruitFactory fruits;
  final ExampleEventsHandler handler;
  final Basket<FruitModel> basket1 = new Basket<FruitModel>();
  final Basket<FruitModel> basket2 = new Basket<FruitModel>();

  DragOptions dragOptions = new DragOptions(
    selector: 'fruit-component'
  );

  DropOptions dropOptions = new DropOptions(
    provideSpringOptions: (DragSource source) {
      return new DragSpringOptions(
        springEnterDelay: new Duration(seconds: 2)
      );
    }
  );

  DragDropExample21Component(this.fruits, this.handler) {
    basket1.addAll(fruits.getFruits(7));
    basket2.addAll(fruits.getFruits(2));
  }

  void onDragEnter(DragEnterEvent event) => handler.onDragEnter(event);
  void onDragSpringEnter(DragSpringEnterEvent event) => handler.onDragSpringEnter(event);

}
