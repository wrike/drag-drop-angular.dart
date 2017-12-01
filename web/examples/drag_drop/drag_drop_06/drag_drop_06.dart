import 'package:angular2/angular2.dart';

import '../../common.dart';


@Component(
  selector: 'drag-drop-example-06',
  templateUrl: 'drag_drop_06.html',
  styleUrls: const ['drag_drop_06.css'],
  directives: const [
    CORE_DIRECTIVES,
    DRAG_DROP_DIRECTIVES,
    BasketComponent,
    FruitComponent
  ]
)
class DragDropExample06Component {

  final FruitFactory fruits;
  final ExampleEventsHandler handler;
  final Basket<FruitModel> basket = new Basket<FruitModel>();

  DragOptions dragOptions = new DragOptions(
    selector: 'fruit-component.orange'
  );

  DragDropExample06Component(this.fruits, this.handler) {
    basket.addAll(<FruitModel>[
      fruits.getKiwi(),
      fruits.getOrange(),
      fruits.getLime()
    ]);
  }

  void onDragStart(DragStartEvent event) => handler.onDragStart(event);
  void onDragEnd(DragEndEvent event) => handler.onDragEnd(event);

}
