import 'package:angular2/angular2.dart';

import 'fruit_model.dart';

@Component(
  selector: 'fruit-component',
  templateUrl: 'fruit.html',
  styleUrls: const ['fruit.css'],
  directives: const [
    CORE_DIRECTIVES
  ]
)
class FruitComponent implements OnChanges {

  @HostBinding('style.min-height') String height;
  @HostBinding('style.background') String backgroundColor;

  @Input('model') FruitModel fruit;

  @override
  void ngOnChanges(_) {
    height = '${fruit.size}px';
    backgroundColor = fruit.type.color;
  }
}
