import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:tashtari_admin/controller/items/UpdateController.dart';
import 'package:tashtari_admin/core/constant/color.dart';

class CustomdropDownList extends StatefulWidget {
  final String title;
  final TextEditingController dorpDownSelectedName;
  final TextEditingController dorpDownSelectedId;
  final Color colorCard;

  final List<SelectedListItem>? Listdata;
  const CustomdropDownList(
      {super.key,
      required this.title,
      required this.colorCard,
      required this.dorpDownSelectedName,
      required this.dorpDownSelectedId,
      this.Listdata});

  @override
  State<CustomdropDownList> createState() => _CustomdropDownListState();
}

class _CustomdropDownListState extends State<CustomdropDownList> {
  @override
  Widget build(BuildContext context) {
    ImpItemUpdateController controller = ImpItemUpdateController();
    void ShowdropDownSearch() {
      DropDownState(
        DropDown(
          isDismissible: true,
          bottomSheetTitle: Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          submitButtonChild: const Text(
            'Done',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          data: widget.Listdata ?? [],
          selectedItems: (List<dynamic> selectedList) {
            SelectedListItem selectedone = selectedList[0];
            widget.dorpDownSelectedName.text = selectedone.name;
            widget.dorpDownSelectedId.text = selectedone.value!;
            controller.update();
          },
        ),
      ).showModal(context);
    }

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40))),
      color: widget.colorCard,
      child: ListTile(
        trailing: Icon(
          Icons.arrow_drop_down_circle_sharp,
          color: Colors.white,
        ),
        title: TextFormField(
          controller: widget.dorpDownSelectedName,
          cursorColor: const Color.fromARGB(255, 240, 238, 238),
          onTap: () {
            FocusScope.of(context).unfocus();
            ShowdropDownSearch();
          },
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.white),
            filled: true,
            contentPadding:
                const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
            hintText: widget.dorpDownSelectedName.text == ""
                ? widget.title
                : widget.dorpDownSelectedName.text,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
