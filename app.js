const express = require('express');

const PORT = process.env.PORT;
const app = express();
app.get('/', (req, res) => {
  res.send('hello, world');
});

app.get('/profile', (req, res) => {
  res.send(process.env.PROFILE);
});

app.listen(PORT, () => {
  console.log(`Listening at ${PORT}`);
});