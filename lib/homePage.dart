import 'package:flutter/material.dart';
import 'package:kids/secondPage.dart';

import 'data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Kidzee Sample",
            textAlign: TextAlign.center,
          ),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          padding: EdgeInsets.all(10),
          scrollDirection: Axis.vertical,
          itemCount: home.length,
          itemBuilder: (_, i) {
            var data=home[i];
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NextPage(categoryName: data["category"],),),);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: GridTile(
                  child: Image.network(data["imageUrl"],fit: BoxFit.cover,),
                  footer: GridTileBar(
                    backgroundColor: Colors.black54,
                    title: Center(child: Text("${data["category"].toString().toUpperCase()}",)),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
