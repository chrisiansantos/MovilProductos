class Producto {
  final int id;
  final String nombre;
  final String vendedor;
  final int calificacion;

  Producto(this.id, this.nombre, this.vendedor, this.calificacion);
}

class FavItem {
  final int id;
  final String nombre;
  final String vendedor;
  final int calificacion;

  FavItem(this.id, this.nombre, this.vendedor, this.calificacion);

  Map<String , dynamic> toMap() {
    return {
      'id': id,
      'nombre' : nombre,
      'vendedor' : vendedor,
      'calificacion' : calificacion,
    };
  }
}
