const connection = require('../config/db');

exports.getQuestions = (req, res) => {
    const query = 'SELECT * FROM question';

    connection.query(query, (err, results) => {
        if (err) throw err;

        res.json(results);
    });
};
