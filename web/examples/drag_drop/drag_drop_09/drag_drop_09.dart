import 'package:angular2/angular2.dart';

import '../../common.dart';


@Component(
  selector: 'drag-drop-example-09',
  templateUrl: 'drag_drop_09.html',
  styleUrls: const ['drag_drop_09.css'],
  directives: const [
    CORE_DIRECTIVES,
    DRAG_DROP_DIRECTIVES,
    BasketComponent,
    FruitComponent
  ]
)
class DragDropExample09Component {

  final FruitFactory fruits;
  final ExampleEventsHandler handler;
  final Basket<FruitModel> basket = new Basket<FruitModel>();
  final ElementRef elRef;

  Element get el => elRef.nativeElement as Element;

  DragOptions _dragOptions;
  DragOptions get dragOptions => _getDragOptions();

  DragOptions _getDragOptions() {
    if (_dragOptions == null) {
      _dragOptions = new DragOptions(
        selector: 'fruit-component',
        provideGhost: (DragSource source) {
          FruitModel fruit = source.model as FruitModel;
          Element dragImageElement = el.querySelector('drag-images .dragImage.${fruit.typeName.toLowerCase()}');
          return new DragGhostOptions(
            element: dragImageElement
          );
        }
      );
    }
    return _dragOptions;
  }

  DragDropExample09Component(this.fruits, this.handler, this.elRef) {
    basket.addAll(<FruitModel>[fruits.getBanana(), fruits.getPlum()]);
  }

  void onDragStart(DragStartEvent event) => handler.onDragStart(event);
  void onDragEnd(DragEndEvent event) => handler.onDragEnd(event);

}
