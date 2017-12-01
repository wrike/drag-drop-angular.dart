import 'package:angular2/angular2.dart';

import '../../common.dart';


@Component(
  selector: 'drag-drop-example-10',
  templateUrl: 'drag_drop_10.html',
  styleUrls: const ['drag_drop_10.css'],
  directives: const [
    CORE_DIRECTIVES,
    DRAG_DROP_DIRECTIVES,
    BasketComponent,
    FruitComponent
  ]
)
class DragDropExample10Component {

  final FruitFactory fruits;
  final ExampleEventsHandler handler;
  final Basket<FruitModel> basket = new Basket<FruitModel>();

  DragOptions dragOptions = new DragOptions(
    selector: 'fruit-component',
    beforeStart: (DragSource source, DragDropSimpleData data, MouseEvent event) {
      FruitModel fruit = source.model as FruitModel;
      data.setLink('http://www.google.com/search?q=${fruit.type.name}&tbm=isch');
      event.dataTransfer.effectAllowed = 'copy,move';
    }
  );

  DragDropExample10Component(this.fruits, this.handler) {
    basket.addAll(fruits.getFruits(7));
  }

  void onDragStart(DragStartEvent event) => handler.onDragStart(event);
  void onDragEnd(DragEndEvent event) => handler.onDragEnd(event);
}
