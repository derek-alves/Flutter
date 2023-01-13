import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:websocket_server/counter_cubit.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) {
    final cubit = context.read<CounterCubit>()..subscribe(channel);

    channel.sink.add('${cubit.state}');
    channel.stream.listen(
      (event) {
        cubit.increment();
      },
      onDone: () => cubit.subscribe(channel),
    );
  });
  return handler(context);
}
