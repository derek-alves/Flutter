import 'package:feichas/features/items/data/models/default_create_response_model.dart';
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
                      onPressed: () async {
                        _formKey.currentState?.save();
                        print(_formKey.currentState!.value);
                        final DefaultCreateResponseModel response =
                            await controller
                                .createItem(_formKey.currentState!.value);
                        controller.allItems.add(
                            ItemModel(response.item.id, response.item.title));

                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        _formKey.currentState!.reset();
                        Get.defaultDialog(
                          textCancel: "Ok",
                          title: "Sucesso",
                          titleStyle: const TextStyle(
                              color: Colors.green, fontSize: 25),
                          middleText: response.message,
                        );
                      },
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
                            name: "title",
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
                            child: Obx(() {
                              return ListView.separated(
                                itemCount: controller.allItems.length,
                                itemBuilder: (_, index) {
                                  final ItemModel item =
                                      controller.allItems[index];
                                  return Dismissible(
                                    key: Key(item.title),
                                    background: Container(
                                      color: Theme.of(context).errorColor,
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      alignment: Alignment.centerRight,
                                      padding: const EdgeInsets.only(right: 20),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 4),
                                    ),
                                    direction: DismissDirection.endToStart,
                                    onDismissed: (_) async {
                                      await controller.deleteItem(item.id);
                                      controller.allItems.removeAt(index);
                                      const snackBar = SnackBar(
                                        backgroundColor: Colors.redAccent,
                                        content: Text('Deletado com sucesso'),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    },
                                    child: ListTile(
                                      title: Text(
                                        item.title,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      onTap: () {},
                                    ),
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
