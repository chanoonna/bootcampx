const { Pool } = require('pg');
const pool = new Pool ({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const args = process.argv.slice(2);
const values = [`${args[0]}`];

pool.query(`
SELECT DISTINCT t.name AS teacher, c.name AS cohort
FROM assistance_requests asrq
JOIN students s
  ON s.id = asrq.student_id
JOIN cohorts c
  ON c.id = s.cohort_id
JOIN teachers t
  ON t.id = asrq.teacher_id
WHERE c.name = $1
ORDER BY t.name;
`, values)
.then(res => {
  console.log('connected');
  res.rows.forEach(user => {
    console.log(`${user.cohort}: ${user.teacher}`);
  })
})
.catch(err => console.log('query error', err.stack));
