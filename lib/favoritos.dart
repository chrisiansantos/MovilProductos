import 'package:flutter/material.dart';
import 'package:parcial_christian_santos/fav_database.dart';
import 'package:parcial_christian_santos/noti.dart';
import 'package:provider/provider.dart';
import 'producto.dart';

class Favoritos extends StatefulWidget {
  const Favoritos({Key? key}) : super(key: key);

  @override
  State<Favoritos> createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavNoti>(
      builder: (context, cart, child){ 
      return FutureBuilder(
        future: FavDatabase.instance.getAllItems(), 
        builder: 
        (BuildContext context, 
        AsyncSnapshot<List<FavItem>> snapshot){
          if (snapshot.hasData){
            final favItems = snapshot.data!;
      
            return favItems.isEmpty
                ? Center(child: Text("Añade productos a favoritos!"))
                : ListView.separated(
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        color: Color.fromARGB(255, 255, 232, 198),
                        child: _FavItem(favItems[index]),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => Divider(
                      height: 10,
                    ),
                    itemCount: favItems.length,
                  );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error al cargar datos"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
      );}
    );
  }
}

class _FavItem extends StatelessWidget {
  final FavItem favItem;

  const _FavItem(this.favItem);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [        
          Image.asset('assets/images/Pc.png', height: 100,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(favItem.nombre),
              Text(favItem.vendedor),
              Text("Calificación ⭐" + favItem.calificacion.toString()),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                await FavDatabase.instance.delete(favItem.id);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Producto eliminado!"),duration: Duration(seconds: 1),)
                    );
                    Provider.of<FavNoti>(context, listen: false).refrescar();
              },)
            ],
          )
        ],
      ),
    );
  }
}
