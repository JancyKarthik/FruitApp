import 'package:flutter/material.dart';
import 'package:fruitsapp/fruitMlodel.dart';
import 'package:fruitsapp/fruitDetail.dart';
import 'package:fruitsapp/fruitsNameShowcase.dart';
// import 'package:listview_on_tap/fruitMlodel.dart';
// import 'package:listview_on_tap/fruitDetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterFruits Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
 MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // static List<String> fruitname =['Apple','Banana','Mango','Orange','pineapple'];
  static List<FruitDataModel> fruitArray = [
    FruitDataModel(name: "avacado",image: "avacado.jpeg"),
    FruitDataModel(name: "banana",image: "banana.jpeg"),
    FruitDataModel(name: "cucumber",image: "cucumber.jpeg"),
    FruitDataModel(name: "grapes",image: "grapes.jpeg"),
    FruitDataModel(name: "kiwi",image: "kiwi.jpeg"),
    FruitDataModel(name: "lemon",image: "lemon.jpeg"),
    FruitDataModel(name: "mango",image: "mango.jpeg"),
    FruitDataModel(name: "orange",image: "orange.jpeg"),
    FruitDataModel(name: "pear",image: "pear.jpeg"),
    FruitDataModel(name: "pineapple",image: "pineapple.jpeg"),
    FruitDataModel(name: "strawberry",image: "strawberry.jpeg")
  ];
   // final List<FruitDataModel> fruitData = List.generate(fruitArray.length, (index) => FruitDataModel('${fruitArray[index]}'));
  TextEditingController searchController = new TextEditingController();
   List<FruitDataModel> fruitsSearched = [];
   List<String> selectedFruits = [];
  var image = Image.asset("Assets/uncheckBoxImage.png");
  // final List<FruitDataModel> Fruitdata = List.generate(fruitname.length, (index) => FruitDataModel('${fruitname[index]}', '${url[index]}','${fruitname[index]} Description...'));
  @override
  void initState(){
    super.initState();
    // image = Image.asset("Assets/uncheckBoxImage.png");
    searchController.addListener(() {
      searchFruits();
  });
}

searchFruits(){
    List<FruitDataModel> _fruits = [];
        _fruits.addAll(fruitArray);
    if (searchController.text.isNotEmpty){
      _fruits.retainWhere((elements){
        String searchItem = searchController.text.toLowerCase();
        String fruitsDisplayName = elements.name.toLowerCase();
        return fruitsDisplayName.contains(searchItem);
      });
    }
setState((){
  fruitsSearched = _fruits;
      });
}


  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;
     var isSelecting = selectedFruits.contains(fruitArray);
    return Scaffold(
      appBar: AppBar(title: Text('Fruits'),
         actions: <Widget> [
           IconButton(
             icon: Icon(
               Icons.done,
               color: Colors.white,
             ),
             onPressed: (){
               Navigator.of(context).push(MaterialPageRoute(
                   builder: (context) => fruitsNameShowcase(passSelectedFruits: selectedFruits) ));

           },
           )
         ],
         ),
        body: Container(
          child: Column(
           children: <Widget>[
             Container(
               padding: EdgeInsets.all(20),
                 child: TextField(
                     controller: searchController,
                     decoration: InputDecoration(
                         labelText: 'Search Fruits',
                         border: new OutlineInputBorder(
                             borderSide: new BorderSide(
                                 color: Theme.of(context).primaryColor
                             )
                         ),
                         prefixIcon: Icon(
                         Icons.search,
                       color: Theme.of(context).primaryColor,
                     )
                     ),
                 )
             ),
             Container(
                padding: EdgeInsets.all(10),
               height: 75,
               // decoration: BoxDecoration(
               //   shape: BoxShape.circle,
               //   color: Colors.cyan
               // ),
               child: ListView.builder(
                 itemCount: isSearching == true ? fruitsSearched.length : fruitArray.length,
                   scrollDirection: Axis.horizontal,
                   itemBuilder:(context,index){
                     return Card(
                         // child: ListTile(
                       color: Colors.green,

                       child: Text( isSearching == true ? fruitsSearched[index].name: fruitArray[index].name, style: TextStyle(fontSize: 20 ),),

                     // ),
                     );
                   }
               )
             ),

             Expanded(
             child: ListView.builder(
    itemCount: isSearching == true ? fruitsSearched.length : fruitArray.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(isSearching == true ? fruitsSearched[index].name: fruitArray[index].name),
              leading: SizedBox(
                width: 50,
                height: 50,
                // child: Image.network(Fruitdata[index].ImageUrl),
                child: Image.asset(isSearching == true ? "Assets/${fruitsSearched[index].image}" : "Assets/${fruitArray[index].image}"),
              ),
                // if selectedFruits.contains(fruitData){
              trailing: SizedBox(
              width: 25,
              height: 25,
              child:
                (selectedFruits.contains(fruitArray[index]) ? image : image),
              ),
              onTap: () {
                print("hi tap");
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => fruitDetail(index: index, fruitDataModel: fruitArray)));
                // isSelecting: (bool value){
                   setState(() {
                     // isSelecting = !isSelecting;
                    if (selectedFruits.contains(fruitArray[index])){
                    selectedFruits.remove(fruitArray[index].name);
                    // selectedFruits.remove(fruitArray[index].image);
                    print('Reached SelectedFruits-----${selectedFruits}');
                   image = Image.asset("Assets/uncheckBoxImage.png");
                    }
                    else{
                    selectedFruits.add(fruitArray[index].name);
                    // selectedFruits.add(fruitArray[index].image);
                    print('Reached SelectedFruits-----${selectedFruits}');
                    image = Image.asset("Assets/checkBoxImage.png");
                    }
                     });
                // };

              },
            ),
          );
        }
    )
    )
        ],
    ),

    ),
    );
  }

}


