import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
       body: ListView(
         padding: EdgeInsets.all(10.0),
         children: <Widget>[
           _cardTipo1(),
           SizedBox(height: 50.0),
           _cardTipo2(),

         ],
       ),
      );
  }
  Widget _cardTipo1() {

    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget> [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.orange),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text('Soy el sbutitulo de esta tarjeta y tengo que poner algo que sea extenso para que rellene el espacio'),
               
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},  
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    return Card(
      child: Column(
        children: <Widget>[

         FadeInImage(
           image: NetworkImage ('https://th.bing.com/th/id/R4eb01b6d1de8180fc16a7ea457df2dd0?rik=mDmVmiPWKjG19Q&riu=http%3a%2f%2fwallup.net%2fwp-content%2fuploads%2f2016%2f01%2f102787-nature-mountain-river-landscape.jpg&ehk=tKQDONLRX3EXEvzzdRuXB5UBE3a0IgFKug46zeMojOg%3d&risl=&pid=ImgRaw'),
           placeholder: AssetImage ('assets/jar-loading.gif'),
           fadeInDuration: Duration( milliseconds : 20),
           height: 300,
           fit: BoxFit.cover,
         ),
           Container(
            padding: EdgeInsets.all(10.0),
            child: Text (' podemos agragar informacio aqui '))
        ],
      ),
    );
  }
}


