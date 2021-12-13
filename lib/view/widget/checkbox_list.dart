import 'package:cloudnet/view/widget/ModalWithScroll.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

typedef ValueSelectedMultipleChanged<T> = void Function(List<ListModel<T>> value);

class CheckboxList<T> extends StatelessWidget {
   CheckboxList({Key? key, required this.listData, this.onMultipleSelect}) : super(key: key);
  final ValueSelectedMultipleChanged<T?>? onMultipleSelect;
  final List<ListModel<T>> listData;
  final List<ListModel<T>> valuesSelect = [];
  final controller = BehaviorSubject<List<ListModel<T>>>();
  
  @override
  Widget build(BuildContext context) {
    controller.add(valuesSelect);
    return StreamBuilder<List<ListModel<T>>>(
      stream: controller.stream,
      builder: (context, snapshot) {
        return ListView(
          children: listData.map((ListModel<T> d) {
            return new CheckboxListTile(
              title: new Text(d.title),
              value: valuesSelect.contains(d),
              activeColor: Colors.pink,
              checkColor: Colors.white,
              onChanged: (bool? value) {
                if(value!) {
                  valuesSelect.add(d);
                }else{
                  valuesSelect.remove(d);
                }
                controller.add(valuesSelect);
                onMultipleSelect!.call(valuesSelect);
              },
            );
          }).toList(),
        );
      }
    );
  }
}
