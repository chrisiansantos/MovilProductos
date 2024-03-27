import Producto from '../models/Producto.js';

const getAllProductos = async () => {
  try {
    const allProductos = await Producto.findAll();
    return allProductos;
  } catch (error) {
    throw { status: 500, message: error.message || "Error al obtener los productos" };
  }
};

export default{ getAllProductos };
