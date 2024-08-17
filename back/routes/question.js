const express = require('express');
const router = express.Router();
const questionController = require('../controllers/questionController');

// Comentar o eliminar temporalmente el middleware de autenticación
// const verifyToken = require('../middleware/verifyToken');

// Sin autenticación requerida
router.get('/questions', questionController.getQuestions);

module.exports = router;
