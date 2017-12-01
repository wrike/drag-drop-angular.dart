import 'dart:async';

import 'package:angular2/angular2.dart';

import '../../common.dart';


@Directive(
  selector: '[custom-drop-options]'
)
class CustomDropDirective extends BaseDragDropDirective implements AfterViewChecked, AfterViewInit, OnDestroy, OnChanges {

  @Input('custom-drop-options') DropOptions options;

  @Output() Stream<DragEnterEvent> get onCustomDragEnter => dragEnterStream;
  @Output() Stream<DragOverEvent> get onCustomDragOver => dragOverStream;
  @Output() Stream<DragLeaveEvent> get onCustomDragLeave => dragLeaveStream;
  @Output() Stream<DropEvent> get onCustomDrop => dropStream;

  CustomDropDirective(NgZone ngZone, DragDropSubscriptionFactory subscriptionFactory, ElementRef elRef): super(ngZone, subscriptionFactory, elRef);

  @override
  void ngOnChanges(Map<String, SimpleChange> changes) {
    setOptions(options);
  }
}

