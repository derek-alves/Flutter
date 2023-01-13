import 'package:dart_frog/dart_frog.dart';
import 'package:websocket_server/counter_provider.dart';

Handler middleware(Handler handler) => handler.use(counterProvider);
