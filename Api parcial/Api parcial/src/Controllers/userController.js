import jwt from 'jsonwebtoken';
import userService from '../Services/userService.js';

const loginUser = async (req, res) => {
    try {
        const { email, password } = req.body;
        
        if (!email || !password) {
            throw new Error("Debe proporcionar un correo electrónico y una contraseña");
        }

        const user = await userService.loginUser(email, password);
        
        const token = jwt.sign({ userId: user.id, email: user.email }, process.env.JWT_SECRET, { expiresIn: '7d' });
        
        res.status(200).json({ success: true, message: "Inicio de sesión exitoso", token });
    } catch (error) {
        if (error.message === "Credenciales inválidas") {
            res.status(401).json({ success: false, message: "Credenciales inválidas" });
        } else {
            res.status(500).json({ success: false, message: "Error al iniciar sesión", error: error.message });
        }
    }
};

export default { loginUser };
