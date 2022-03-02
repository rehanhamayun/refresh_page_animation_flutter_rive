import 'package:flutter/material.dart';

class DataPage extends StatelessWidget {
  int rehan = 1;
  DataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        child: Container(
          alignment: Alignment(0, 0),
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.amber,
          ),
          child: Text(
            "${rehan++}",
            style: TextStyle(
                color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      itemCount: 5,
      separatorBuilder: (BuildContext context, int index) {
        return Container();
      },
    );
  }
}
