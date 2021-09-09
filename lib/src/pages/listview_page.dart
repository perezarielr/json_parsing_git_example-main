import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = new ScrollController();
  
  List<int> _listaNumeros = new List() ;
  int _ultimoNumero = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agragar10();
    
    _scrollController.addListener(() { 

      if ( _scrollController.position.pixels ==_scrollController.position.maxScrollExtent ) {
        //_agragar10();
        fetchData();
      }
    });
  } 
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose(); //para prevenir fugas de memoria, borra el _scrollController
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
      ),
      body: Stack(
        children: [
           _crearLista(),
           _crearLoading(),
      ],
      ) 
      
    );
  }

  Widget _crearLista() {

    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context,int index ) {
    
         final imagen = _listaNumeros[index]; 
    
          return FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"),
            image: NetworkImage("https://picsum.photos/500/300?image=$imagen")
          );
        }
    
      ),
    );
  }

  Future<Null> obtenerPagina1() async {

    final duration = new Duration(seconds: 2);
    return new Timer(duration, () {

      _listaNumeros.clear();
      _ultimoNumero++;
      _agragar10();
     });
  }

  void _agragar10() {

    for (var i = 1; i < 10; i++) {
      _ultimoNumero++;
      _listaNumeros.add(_ultimoNumero);
    }
    setState(() {
      
    });
  }

  Future fetchData() async {

    _isLoading = true;
    setState(() { });
    final duration = Duration( seconds: 2);
    new Timer(
      duration ,
      respuestaHTTP
    );
  }
  void respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
    _agragar10();
  }

  Widget _crearLoading() {
    
    if ( _isLoading ) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 20.0,)
        ],
      );
    } else {
      return Container();
    }
  }
}