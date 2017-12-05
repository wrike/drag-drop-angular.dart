import 'package:angular2/di.dart';
import 'package:drag_drop/movement.dart';


@Injectable()
MovementOptions injectableMovementOptionsFactory(
  @SkipSelf() @Optional() MovementOptions options
) =>
  options ?? MovementOptionsFactory();

const Provider MovementOptionsProvider =
  const Provider(MovementOptions, useFactory: injectableMovementOptionsFactory);


@Injectable()
MovementManager injectableMovementManagerFactory(
  @SkipSelf() @Optional() MovementManager manager,
  MovementOptions movementOptions
) =>
  manager ?? MovementManagerFactory(
    movementOptions: movementOptions
  );

const Provider MovementManagerProvider =
  const Provider(MovementManager, useFactory: injectableMovementManagerFactory);


const MOVEMENT_PROVIDERS = const [
  MovementOptionsProvider,
  MovementManagerProvider
];
