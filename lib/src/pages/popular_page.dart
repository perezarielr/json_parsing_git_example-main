import 'package:flutter/material.dart';

class PopularPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white70,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, color: Colors.black54),
            )
          ]),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _image01(),
          //SizedBox(height: 10.0),
          _image02(),
          SizedBox(height: 15.0),
          _image03(),
        ],
      ),
    );
  }

  Widget _image01() {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular(20.0)),
      child: Column(children: <Widget>[
        ListTile(
          title: Text('Popular', style: TextStyle(fontSize: 40.0)),
          subtitle: Text('illustrations',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0)),
        ),
      ]),
    );
  }

  Widget _image02() {
    return Card(
      color: Colors.grey[200],
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.search, color: Colors.black54),
            title: Text('Search'),
          ),
        ],
      ),
    );
  }

  Widget _image03() {
    return Card(
        elevation: 0.0,
        child: Column(children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://image.freepik.com/vector-gratis/dunas-cactus-paisaje-desertico_23-2148269880.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 10),
            height: 300,
            fit: BoxFit.fitWidth,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.panorama_wide_angle_select,
                color: Colors.brown[900],
                size: 50.0,
              ),
              Icon(
                Icons.panorama_wide_angle_select,
                color: Colors.brown,
                size: 50.0,
              ),
              Icon(
                Icons.panorama_wide_angle_select,
                color: Colors.orange[600],
                size: 50.0,
              ),
              Icon(
                Icons.panorama_wide_angle_select,
                color: Colors.blue[200],
                size: 50.0,
              ),
              Icon(
                Icons.panorama_wide_angle_select,
                color: Colors.blue[800],
                size: 50.0,
              ),
            ],
          ),
          Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.tune, color: Colors.grey[400], size: 34.0),
            SizedBox(width: 30.0),
            FlatButton(
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: Colors.black54,
              child: Text('Buy'),
              onPressed: () {},
            )
          ]),
        ]));
  }
}
