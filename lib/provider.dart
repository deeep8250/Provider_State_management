import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class to_do_list_provider extends ChangeNotifier{


  List<TextField> wroklist =[];
  TextEditingController reciever = TextEditingController();

  List list()=>wroklist;

  void addWork(){
    wroklist.add(
      TextField(
        maxLines: null,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.redAccent,

              )
            ),
        ),

      ),
    );
    notifyListeners();
  }

  TextField showWork(int i){
    return wroklist[i];
  }


}
