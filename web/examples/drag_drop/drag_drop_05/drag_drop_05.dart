import 'package:angular2/angular2.dart';

import '../../common.dart';


@Component(
  selector: 'drag-drop-example-05',
  templateUrl: 'drag_drop_05.html',
  styleUrls: const ['drag_drop_05.css'],
  directives: const [
    CORE_DIRECTIVES,
    DRAG_DROP_DIRECTIVES,
    BasketComponent,
    FruitComponent
  ]
)
class DragDropExample05Component {

  final FruitFactory fruits;
  final ExampleEventsHandler handler;
  final Basket<FruitModel> basket = new Basket<FruitModel>();

  DragOptions dragOptionsBasket = new DragOptions(
    selector: 'basket-component'
  );

  DragOptions dragOptionsFruit = new DragOptions(
    selector: 'fruit-component'
  );

  DragDropExample05Component(this.fruits, this.handler) {
    basket.addAll(fruits.getFruits(7));
  }

  void onBasketDragStart(DragStartEvent event) => handler.onDragStart(event);
  void onBasketDragEnd(DragEndEvent event) => handler.onDragEnd(event);

  void onFruitDragStart(DragStartEvent event) => handler.onDragStart(event);
  void onFruitDragEnd(DragEndEvent event) => handler.onDragEnd(event);

}
