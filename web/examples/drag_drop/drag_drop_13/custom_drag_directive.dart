import 'dart:async';

import 'package:angular2/angular2.dart';

import '../../common.dart';


@Directive(
    selector: '[custom-drag-options]'
)
class CustomDragDirective extends BaseDragDropDirective implements AfterViewChecked, AfterViewInit, OnDestroy, OnChanges {
  @Input('custom-drag-options') DragOptions options;

  @Output() Stream<DragStartEvent> get onCustomDragStart => dragStartStream;
  @Output() Stream<DragEndEvent> get onCustomDragEnd => dragEndStream;

  CustomDragDirective(NgZone ngZone, DragDropSubscriptionFactory subscriptionFactory, ElementRef elRef)
      : super(ngZone, subscriptionFactory, elRef);

  @override
  void ngOnChanges(Map<String, SimpleChange> changes) {
    setOptions(options);
  }
}
