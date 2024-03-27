import express from "express";
import userRoutes from "./src/v1/Routes/usuarioRoutes.js";
import db from "./src/Database/db.js";
import productRoutes from "./src/v1/Routes/productosRoutes.js";
import path from "path"; 

// Crear la aplicación de express
const app = express();
// Puerto
const PORT = process.env.PORT || 3000;

// json middleware
app.use(express.json());

//Conexion a la base de datos
try{
    await db.authenticate();
    db.sync()
    console.log('Conexión Correcta a la Base de Datos de MySQL')
} catch(error){
    console.log(error)
}

// Configurar la carpeta pública
app.use(express.static('public'))


// Routes
app.use("/api/v1/auth/",userRoutes );
app.use("/api/v1/", productRoutes);


// Iniciar el servidor
app.listen(PORT, () => {
  console.log(`API corriendo en http://localhost:${PORT}`);
});