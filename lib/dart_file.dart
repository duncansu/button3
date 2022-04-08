import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppBody extends StatelessWidget {

  late BuildContext context;
   String dropdownValue="one";

  @override
  Widget build(BuildContext context) {
    this.context = context;

    final nameController = TextEditingController();
    final nameField = TextField(
      controller: nameController,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        labelText: '輸入姓名',
        labelStyle: TextStyle(fontSize: 20),
      ),
    );

    // Button.
    final btn = RaisedButton(
      child: Text('確定'),
      onPressed: () => _showSnackBar(nameController.text),
    );
    final btn1 = PopupMenuButton(
      itemBuilder: (context) =>
      <PopupMenuEntry>[
        PopupMenuItem(
          child: Text("第一項", style: TextStyle(fontSize: 20),
          ),
          value: 1,
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          child: Text("第二項", style: TextStyle(fontSize: 20),),
          value: 2,
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          child: Text("第三項", style: TextStyle(fontSize: 20),),
          value: 3,
        ),
      ],
      child: Text(
        '開啟選單',
        style: TextStyle(fontSize: 20),
      ),
      color: Colors.yellow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      offset: Offset(120, 30),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      onSelected: (value) =>
          Fluttertoast.showToast(
              msg: '你按下SnackBar',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 20.0),
      onCanceled: () => Fluttertoast.showToast(msg: '取消選擇'),
    );
    final button2=DropdownButton(items: <String>['One', 'Two', 'Free', 'Four']
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
        // onSlected: (value)  => Fluttertoast.showToast(
        //   msg: '你按下SnackBar',
        //   toastLength: Toast.LENGTH_LONG,
        //   gravity: ToastGravity.TOP,
        //   backgroundColor: Colors.blue,
        //   textColor: Colors.white,
        //   fontSize: 20.0),
      );
    }).toList(), onChanged:(String? newValue) {

        dropdownValue = newValue!;
      });





    // Arrange widgets.
    final widget = Center(
      child: Column(
        children: <Widget>[
          Container(child: nameField,
            width: 200,
            margin: EdgeInsets.symmetric(vertical: 10),),
          Container(child: btn, margin: EdgeInsets.symmetric(vertical: 10),),
          Container(child: btn1,margin: EdgeInsets.symmetric(vertical: 40),),
          Container(child: button2,margin: EdgeInsets.symmetric(vertical: 40),)
        ],
      ),
    );

    return widget;
  }


  void _showSnackBar(String msg) {
    // 建立SnackBar物件
    final snackBar = SnackBar(
      content: Text(msg),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.blue,
    );

    // 顯示SnackBar
    Scaffold.of(context).showSnackBar(snackBar);
  }




}









class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },



      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
            // onSlected: (value)  => Fluttertoast.showToast(
            //   msg: '你按下SnackBar',
            //   toastLength: Toast.LENGTH_LONG,
            //   gravity: ToastGravity.TOP,
            //   backgroundColor: Colors.blue,
            //   textColor: Colors.white,
            //   fontSize: 20.0),
        );
      }).toList(),
    );
  }
}



  void _showSnackBar(String msg) {
    // 建立SnackBar物件

}
