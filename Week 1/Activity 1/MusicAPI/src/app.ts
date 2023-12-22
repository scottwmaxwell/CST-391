import express, { Request, Response } from 'express';
import dotenv from "dotenv";

import albumsRouter from './albums/albums.routes';
import artistsRouter from './artists/artists.routes';
import logger from './middleware/logger.middleware';

dotenv.config();

// Save app
const app = express();

// Port to listen on
const port = 3000;

if(process.env.NODE_ENV == 'development'){
    // add logger middleware
    app.use(logger);
    console.log(process.env.GREETING + "in dev mode");
}

app.use('/', [albumsRouter, artistsRouter]);

// When / is accessed, send a response
app.get('/', (req: Request, res: Response) => {
    res.send('Hello World from TypeScript!'); // response to send
});

// Start the app to listen on port 3000
app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`); 
    console.log(process.env.GREETING);
});