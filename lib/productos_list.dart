import 'package:flutter/material.dart';
import 'package:parcial_christian_santos/fav_database.dart';
import 'producto.dart';

class ProductosList extends StatelessWidget {
  var productos = [
    Producto(1, "Computador uno", "Carlos Marx", 5),
    Producto(2, "Computador dos", "Carlos Julio", 5),
    Producto(3, "Computador tres", "Alfredo Cabaña", 5),
    Producto(4, "Computador cuatro", "Daniel Ortiz", 5),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Color.fromARGB(255, 238, 238, 238),
          child: Row(
            children: [
              Expanded(child: _ProductosItem(productos[index])),
              IconButton(
                icon: Icon(Icons.star),
                onPressed: () async {
                  await addFav(productos[index]);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Producto añadido!"),duration: Duration(seconds: 1),)
                    );
                },
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(height: 5);
      },
      itemCount: productos.length,
    );
  }

Future<void> addFav(Producto producto) async {
  final item = FavItem(producto.id, producto.nombre, producto.vendedor, producto.calificacion);
  await FavDatabase.instance.insert(item);
}

}

class _ProductosItem extends StatelessWidget {
  final Producto producto;

  const _ProductosItem(this.producto);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset('assets/images/Pc.png', height: 100,),
          const Padding(padding: EdgeInsets.only(right: 3, left: 3)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(producto.nombre),
              Text(producto.vendedor),
              Text("Calificación ⭐" + producto.calificacion.toString()),
            ],
          ),
        ],
      ),
    );
  }
}