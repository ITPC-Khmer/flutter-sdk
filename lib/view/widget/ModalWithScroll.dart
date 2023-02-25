import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class ListModel<T> {
  late String key;
  late String title;
  late bool isSelect;
  T? data;
  ValueChanged<T?>? onSelect;
  ListModel(
      {required this.key,
      required this.title,
      this.data,
      this.onSelect,
      this.isSelect = false});
}

class ModalWithScroll<T> extends StatelessWidget {
  final _controller = BehaviorSubject<List<ListModel<T>>>();
  final List<ListModel<T>> gList;
  ModalWithScroll({Key? key, required this.gList}) : super(key: key);

  Widget listView(BuildContext context) {
    return StreamBuilder<Object>(
        stream: _controller.stream,
        builder: (context, snapshot) {
          return ListView.builder(
            shrinkWrap: true,
            // controller: ModalScrollController.of(context),
            itemCount: gList.length,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  if (gList[i].onSelect != null) {
                    gList[i].onSelect!.call(gList[i].data);

                    gList.forEach((element) {
                      element.isSelect = false;
                    });
                    gList[i].isSelect = !gList[i].isSelect;

                    _controller.add(gList);
                  }
                },
                child: Container(
                    child: ListTile(
                      leading: gList[i].isSelect
                          ? Icon(
                              Icons.radio_button_checked,
                              color: Colors.blue,
                            )
                          : Icon(Icons.radio_button_off_outlined),
                      title: Text(
                        gList[i].title,
                        style: TextStyle(
                            color:
                                gList[i].isSelect ? Colors.blue : Colors.black),
                      ),
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade200),
                            top: i == 0
                                ? BorderSide(color: Colors.grey.shade200)
                                : BorderSide.none),
                        color: gList[i].isSelect
                            ? Colors.grey.shade50
                            : Colors.white)),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    _controller.add(gList);
    return Material(
        child: SafeArea(
      child: gList.length > 10
          ? Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.search),
                            hintText: "Search...",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 1),
                            suffix: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {},
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: listView(context),
                  ),
                ],
              ),
            )
          : listView(context),
    ));
  }
}
