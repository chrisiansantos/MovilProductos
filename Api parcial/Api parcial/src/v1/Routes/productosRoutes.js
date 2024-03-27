import express from "express";
import productoController from "../../Controllers/productoController.js";

const router = express.Router();


router.get("/productos",productoController.getAllProductos);


export default router;
