import 'package:flutter/material.dart';
import 'package:fruitsapp/fruitMlodel.dart';

class fruitDetail extends StatefulWidget {
  final List<FruitDataModel> fruitDataModel;
  int index;
  fruitDetail({Key? key, required this.index, required this.fruitDataModel}) : super(key: key);
  @override
  State<fruitDetail> createState() => _fruitDetailState();
}
class _fruitDetailState extends State<fruitDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.fruitDataModel[widget.index].name),),
      body: Column(
        children: [
          Image.asset("Assets/${widget.fruitDataModel[widget.index].image}"),
          SizedBox(
            height: 10,
          ),
          // Text(widget.fruitDataModel[widget.index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                heroTag: "f1",
                onPressed: (){
                  setState(() {
                    if(widget.index!=0){
                      widget.index --;
                    }
                  });
                },
                child:Icon(Icons.arrow_back_ios) ,
              ),
              FloatingActionButton(
                heroTag: "f2",
                onPressed: (){
                  setState(() {
                    if(widget.index != widget.fruitDataModel.length-1){
                      widget.index ++;
                    }
                  });
                },
                child:Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ],
      ),
    );
  }
}