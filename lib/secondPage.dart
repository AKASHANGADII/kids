import 'package:flutter/material.dart';
import 'package:kids/data.dart';
import 'package:text_to_speech/text_to_speech.dart';

class NextPage extends StatelessWidget {
  final String categoryName;
  late List<Map> category;
  NextPage({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    switch(categoryName){
      case "animals": category = animals;break;
      case "birds": category = birds;break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${categoryName.toUpperCase()}"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemCount: category.length,
          itemBuilder: (_, i) {
            var data=category[i];
            return GestureDetector(
              onTap: (){
                TextToSpeech tts = TextToSpeech();
                tts.speak(data["name"]);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: GridTile(
                  child: Image.network(data["imageUrl"], fit: BoxFit.cover,),
                  footer: GridTileBar(
                    backgroundColor: Colors.black54,
                    title: Center(child: Text(data["name"])),
                  ),
                ),
              ),
            );
          }),
    );
  }
}





