/* eslint-disable camelcase */
const properties = require('./json/properties.json');
const users = require('./json/users.json');
const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'lightbnb'
});

// test connection to database
// the following assumes that you named your connection variable `pool`
// pool.query('SELECT title FROM properties LIMIT 10;').then(response => {
//   console.log(response);
// });


/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function (email) {
  const text = 'SELECT * FROM users WHERE email = $1';
  const values = [email];

  return pool
    .query(text, values)
    .then((result) => {
      return result.rows[0];
    })
    .catch((err) => {
      console.error('Error getting user with email: ', err);
      return null;
    });
};
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function (id) {
  const text = 'SELECT * FROM users WHERE id = $1';
  const values = [id];

  return pool
    .query(text, values)
    .then((res) => {
      return res.rows[0];
    })
    .catch((err) => {
      console.error('Error getting user with id: ', err);
    });
};
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser =  function (user) {
  const text = 'INSERT INTO users (name, password, email) VALUES ($1, $2, $3) RETURNING *';
  const values = [user.name, user.password, user.email];

  return pool
    .query(text, values)
    .then((res) => {
      console.log('Added user: ', res.rows[0]);
    })
    .catch((err) => {
      console.error('Error adding user: ', err);
    });
    
};
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function (guest_id, limit = 10) {
  const text = `
    SELECT
      properties.*,
      reservations.*,
      avg(rating) as average_rating
    FROM
      reservations
      JOIN properties ON properties.id = reservations.property_id
      JOIN property_reviews ON property_reviews.property_id = properties.id
    WHERE
      reservations.guest_id = $1
    GROUP BY
      properties.id,
      reservations.id
    ORDER BY
      reservations.start_date
    LIMIT
      $2`;
  const values = [guest_id, limit];
  return pool
    .query(text, values)
    .then((result) => {
      return result.rows;
    })
    .catch((err) => {
      console.error('Error getting all reservations: ', err);
      return null;
    });
};
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = (options, limit = 10) => {
  const text = 'SELECT * FROM properties LIMIT $1';
  const values = [limit];

  return pool
    .query(text, values)
    .then((result) => {
      return result.rows;
    })
    .catch((err) => {
      console.error('Error getting all properties: ', err);
    });
};
exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function (property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
};
exports.addProperty = addProperty;
