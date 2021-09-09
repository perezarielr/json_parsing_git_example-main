import 'package:flutter/material.dart';



class AvatarPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          Container(
            padding: EdgeInsets.all(2.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://exprimetuuva.files.wordpress.com/2010/11/bob_esponja4.gif"),
              radius: 30.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(child: Text("BE"),
            backgroundColor: Colors.orange,),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(placeholder: AssetImage("assets/jar-loading.gif"),
        fadeInDuration: Duration(milliseconds: 200),
         image: NetworkImage("https://www.ecured.cu/images/thumb/e/e3/Bob-esponja23.jpg/1200px-Bob-esponja23.jpg")),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: () {
          Navigator.pop(context);
        }
      ),
    );
  }
}
