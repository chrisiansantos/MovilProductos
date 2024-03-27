import productoService from '../Services/productoService.js';

const getAllProductos = async (req, res) => {
  try {
    const allProductos = await productoService.getAllProductos();
    res.send({ status: "OK", data: allProductos });
  } catch (error) {
    res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
  }
};

export default { getAllProductos };
