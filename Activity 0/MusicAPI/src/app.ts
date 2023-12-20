import express, { Request, Response } from 'express';

// Save app
const app = express();

// Port to listen on
const port = 3000;

// When / is accessed, send a response
app.get('/', (req: Request, res: Response) => {
    res.send('Hello World from TypeScript!'); // response to send
});

// Start the app to listen on port 3000
app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});