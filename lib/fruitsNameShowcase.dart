import 'package:flutter/material.dart';
 import 'package:fruitsapp/singleImagePicker.dart';


class fruitsNameShowcase extends StatefulWidget {

  final List<String> passSelectedFruits;
   // int index;
  fruitsNameShowcase({Key? key, required this.passSelectedFruits}) : super(key: key);


  @override
 State<fruitsNameShowcase> createState() => _fruitsNameShowcaseState();
}

class _fruitsNameShowcaseState extends State<fruitsNameShowcase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('    SearchedFruits'),
          actions: <Widget>[
          Padding(
          padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {
            print ("tapping");
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => singleImagePicker () ));
            // Navigator.of(context).push(MaterialPageRoute(builder: context) => singleImagePicker());

          },
          child: Icon(
            Icons.arrow_forward,
            size: 26.0,
          ),
        )
    ),
    ]
    ),



      body:  (
      Container(
        child: Center(
          child: Text(widget.passSelectedFruits.join(","),style: TextStyle(fontSize: 20),),

      )

           // Text(widget.passSelectedFruits.join(","))
      )
      )
    );
}
}

// Container(
// child: Center(
// child: Text('Your text')
// )
// );