import { DataTypes } from 'sequelize';
import db from '../Database/db.js';

const Producto = db.define('Producto', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  nombre: {
    type: DataTypes.STRING,
    allowNull: false
  },
  descripcion: {
    type: DataTypes.TEXT,
    allowNull: true
  },
  vendedor: {
    type: DataTypes.STRING,
    allowNull: false 
  },
}, {
  timestamps: false
});

export default Producto;
