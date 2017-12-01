import 'dart:async';
import 'dart:html';

import 'package:angular2/angular2.dart';
import 'package:drag_drop/drag_drop.dart';
import 'package:throttle_debounce/throttle_debounce.dart';


abstract class BaseDragDropDirective implements AfterViewChecked, AfterViewInit, OnChanges, OnDestroy {

  static final Duration NG_AFTER_VIEW_CHECKED_INTERVAL = new Duration(milliseconds: 100);

  final StreamController<DragStartEvent> _dragStartController = new StreamController<DragStartEvent>.broadcast();
  final StreamController<DragEnterEvent> _dragEnterController = new StreamController<DragEnterEvent>.broadcast();
  final StreamController<DragSpringEnterEvent> _dragSpringEnterController = new StreamController<DragSpringEnterEvent>.broadcast();
  final StreamController<DragOverEvent> _dragOverController = new StreamController<DragOverEvent>.broadcast();
  final StreamController<DragLeaveEvent> _dragLeaveController = new StreamController<DragLeaveEvent>.broadcast();
  final StreamController<DropEvent> _dropController = new StreamController<DropEvent>.broadcast();
  final StreamController<DragEndEvent> _dragEndController = new StreamController<DragEndEvent>.broadcast();

  final List<StreamSubscription> _subscriptions = new List<StreamSubscription>();

  final NgZone ngZone;
  final DragDropSubscriptionFactory _subscriptionFactory;
  final ElementRef elRef;
  Element get el => elRef?.nativeElement;

  BaseDragDropOptions get options;

  Throttler _ngAfterViewCheckedThrottler;
  DragDropSubscription _dragDropSubscription;

  Stream<DragStartEvent> get dragStartStream => _dragStartController.stream;
  Stream<DragEnterEvent> get dragEnterStream => _dragEnterController.stream;
  Stream<DragSpringEnterEvent> get dragSpringEnterStream => _dragSpringEnterController.stream;
  Stream<DragOverEvent> get dragOverStream => _dragOverController.stream;
  Stream<DragLeaveEvent> get dragLeaveStream => _dragLeaveController.stream;
  Stream<DropEvent> get dropStream => _dropController.stream;
  Stream<DragEndEvent> get dragEndStream => _dragEndController.stream;

  BaseDragDropDirective(this.ngZone, this._subscriptionFactory, this.elRef) {
    _ngAfterViewCheckedThrottler = new Throttler(NG_AFTER_VIEW_CHECKED_INTERVAL, _throttledNgAfterViewChecked, [], true);
  }

  @override
  void ngAfterViewInit() {
    ngZone.runOutsideAngular(() {
      _dragDropSubscription = _subscriptionFactory.getSubscription(el, options);
      _subscriptions.addAll([
        _dragDropSubscription.onDragStart.listen(_dragStartController.add),
        _dragDropSubscription.onDragEnter.listen(_dragEnterController.add),
        _dragDropSubscription.onDragSpringEnter.listen(_dragSpringEnterController.add),
        _dragDropSubscription.onDragOver.listen(_dragOverController.add),
        _dragDropSubscription.onDragLeave.listen(_dragLeaveController.add),
        _dragDropSubscription.onDrop.listen(_dropController.add),
        _dragDropSubscription.onDragEnd.listen(_dragEndController.add)
      ]);
    });
  }

  @override
  void ngAfterViewChecked() {
    _ngAfterViewCheckedThrottler.throttle();
  }

  @override
  void ngOnChanges(Map<String, SimpleChange> changes) {
    setOptions(options);
  }

  @override
  void ngOnDestroy() {
    _dragDropSubscription?.destroy();
    _cancelSubscriptions();
  }

  void _cancelSubscriptions() {
    _subscriptions.forEach((StreamSubscription subscription) => subscription.cancel());
    _subscriptions.clear();
  }

  void _throttledNgAfterViewChecked(_) {
    ngZone.runOutsideAngular(_dragDropSubscription?.updateView);
  }

  void setOptions(BaseDragDropOptions options) {
    ngZone.runOutsideAngular(() {
      _dragDropSubscription?.setOptions(options);
    });
  }

}
