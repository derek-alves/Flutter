import 'package:feichas/features/items/data/models/item_model.dart';
import 'package:feichas/features/items/presenter/list_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// ignore: use_key_in_widget_constructors
class ListScreen extends GetView<ListScreenController> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Tarefas',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 32),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: FormBuilder(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        children: <Widget>[
                          FormBuilderTextField(
                            keyboardType: TextInputType.name,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            name: "name",
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              hintText: "Tarefa",
                              hintStyle: TextStyle(
                                color: Colors.grey[800],
                              ),
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context,
                                  errorText: "Campo obrigatório")
                            ]),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Expanded(
                            child: controller.obx((state) {
                              return ListView.separated(
                                itemCount: state.length,
                                itemBuilder: (_, index) {
                                  final ItemModel item = state[index];
                                  return ListTile(
                                    title: Text(
                                      item.name,
                                      style: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.black),
                                    ),
                                    onTap: () {},
                                  );
                                },
                                separatorBuilder: (_, __) {
                                  return const Divider();
                                },
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
