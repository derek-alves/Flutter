import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getxstudy/home/http/http_page_controller.dart';

class HttpPage extends GetView<HttpPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Http")),
      body: Container(),
    );
  }
}
