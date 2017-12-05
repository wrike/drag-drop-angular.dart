import 'package:angular2/angular2.dart';

import '../../common.dart';

import 'custom_drag_directive.dart';

@Component(
    selector: 'drag-drop-example-13',
    templateUrl: 'drag_drop_13.html',
    styleUrls: const ['drag_drop_13.css'],
    directives: const [
      CORE_DIRECTIVES,
      DRAG_DROP_DIRECTIVES,
      BasketComponent,
      FruitComponent,
      CustomDragDirective
    ]
)
class DragDropExample13Component {

  final FruitFactory fruits;
  final ExampleEventsHandler handler;
  final Basket<FruitModel> basket1 = new Basket<FruitModel>();
  final Basket<FruitModel> basket2 = new Basket<FruitModel>();

  DragOptions dragOptions = new DragOptions(
      selector: 'fruit-component'
  );

  DragOptions customDragOptions = new DragOptions(
      selector: 'basket-component.secondary'
  );

  DragDropExample13Component(this.fruits, this.handler) {
    basket1.addAll(fruits.getFruits(7));
    basket2.addAll(fruits.getFruits(7));
  }

  void onDragStart(DragStartEvent event) => handler.onDragStart(event);
  void onDragEnd(DragEndEvent event) => handler.onDragEnd(event);

  void onCustomDragStart(DragStartEvent event) => handler.onCustomDragStart(event);
  void onCustomDragEnd(DragEndEvent event) => handler.onCustomDragEnd(event);

}
