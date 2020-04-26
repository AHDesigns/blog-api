import express from 'express';

const app = express();

app.get('/api', (req, res) => {
  console.log(req.path);
  res.json({ data: 'bants' });
});

export default app;
