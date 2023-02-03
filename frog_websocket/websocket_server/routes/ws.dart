import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:websocket_server/counter_cubit.dart';
import 'package:websocket_server/message.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) {
    final cubit = context.read<CounterCubit>()..subscribe(channel);
    channel.sink.add('${cubit.state}');
    channel.stream.listen(
      (event) {
        switch ('$event'.toMessage()) {
          case Message.increment:
            cubit.increment();
            break;
          case Message.decrement:
            cubit.decrement();
            break;
          case null:
            break;
          case Message.vote:
            String voteId = 'sdasdfasdf';
            break;
        }
      },
      onDone: () => cubit.unsubscribe(channel),
    );
  });
  return handler(context);
}

extension on String {
  Message? toMessage() {
    for (final message in Message.values) {
      if (this == message.value) {
        return message;
      }
    }
    return null;
  }
}
