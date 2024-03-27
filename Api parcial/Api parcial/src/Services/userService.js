import Usuario from '../Models/Usuario.js';

const loginUser = async (email, password) => {
    try {
        // Buscar al usuario por su correo electrónico
        const user = await Usuario.findOne({ where: { email } });
        
        // Verificar si el usuario no existe
        if (!user) {
            throw new Error("Credenciales inválidas");
        }

        // Verificar si la contraseña coincide con la almacenada en la base de datos
        if (user.password !== password) {
            throw new Error("Credenciales inválidas");
        }

        return user;
    } catch (error) {
        throw error;
    }
};

export default { loginUser };
