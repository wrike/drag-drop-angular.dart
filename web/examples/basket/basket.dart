import 'package:angular2/angular2.dart';

import 'basket_model.dart';
import '../fruit/fruit_model.dart';

@Component(
  selector: 'basket-component',
  templateUrl: 'basket.html',
  styleUrls: const ['basket.css'],
  directives: const [
    CORE_DIRECTIVES
  ]
)
class BasketComponent {

  @Input('basket') Basket<FruitModel> basket;
  @Input('compact') bool isCompact = false;

  String get itemsCount => (basket == null || basket.count == 0)
    ? 'nothing'
    : '${basket.count} item${(basket.count > 1) ? "s" : ""}';

  String get items => basket.items.map((FruitModel f) => f.typeName).join(', ');

}
