const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const args = process.argv.slice(2);
const values = [`%${args[0]}%`, (args[1] || 5)];

pool.query(`
SELECT s.id AS id, s.name AS name, c.name AS cohort
FROM students s
JOIN cohorts c
  ON c.id = s.cohort_id
WHERE c.name LIKE $1
LIMIT $2;
`, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort} cohorts`);
  })
})
.catch(err => console.log('query error', err.stack));