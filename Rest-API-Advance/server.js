'use strict';

require('dotenv').config();
const express = require('express');
const cors = require('cors');
const path = require('path');
const app = express();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));


app.use('/uploads', express.static(path.join(__dirname, 'uploads')));
const routes = require('./routes');
app.use('/', routes);
const errorHandler = require('./middleware/errorHandler');
app.use(errorHandler);


const { sequelize } = require('./models');
const PORT = process.env.PORT || 3000;

(async () => {
  try {
    console.log('Connecting to the database...');
    await sequelize.authenticate();
    console.log('Database connected successfully');

    await sequelize.sync();
    console.log('Database synchronized');

    app.listen(PORT, () => {
      console.log(`EduCourse API server is running on port ${PORT}`);
    });
  } catch (err) {
    console.error('Failed to initialize the application:', err);
    process.exit(1);
  }
})();