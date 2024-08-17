const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const connection = require('../config/db');

exports.login = (req, res) => {
    const { username, password } = req.body;

    // Suponiendo que tienes una tabla 'users' con 'username' y 'password'
    const query = 'SELECT * FROM users WHERE username = ?';

    connection.query(query, [username], (err, results) => {
        if (err) throw err;

        if (results.length === 0) {
            return res.status(401).json({ message: 'Username or password is incorrect' });
        }

        const user = results[0];

        // Verificar la contraseña
        bcrypt.compare(password, user.password, (err, isMatch) => {
            if (err) throw err;

            if (!isMatch) {
                return res.status(401).json({ message: 'Username or password is incorrect' });
            }

            // Crear y firmar el token
            const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET, { expiresIn: '1h' });

            res.json({ token });
        });
    });
};
