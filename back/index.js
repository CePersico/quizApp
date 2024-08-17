const express = require('express');
const bodyParser = require('body-parser');
const dotenv = require('dotenv');
const authRoutes = require('./routes/auth');
const questionRoutes = require('./routes/question');
const cors = require('cors');


dotenv.config();

const app = express();
app.use(bodyParser.json());
app.use(cors());

// Rutas
app.use('/api/auth', authRoutes);
app.use('/api', questionRoutes);

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
