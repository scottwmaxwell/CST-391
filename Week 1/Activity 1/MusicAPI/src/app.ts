import express, { Request, Response } from 'express';
import dotenv from "dotenv";
import cors from 'cors';
import helment from 'helmet';

import albumsRouter from './albums/albums.routes';
import artistsRouter from './artists/artists.routes';
import logger from './middleware/logger.middleware';


dotenv.config();

// Save app
const app = express();

// Middleware
if(process.env.NODE_ENV == 'development'){
    // add logger middleware
    app.use(logger);
    console.log(process.env.GREETING + "in dev mode");
}

app.use(express.json()); // Parse JSON bodies
app.use(express.urlencoded({ extended: true})); // Parse URL-Encoded bodies
app.use(cors()); // allows cross-origin
app.use(helment()); // security (Strict-Transport-Security, Content-Security-Policy, X-Content-Type-Options, X-Frame-Options, X-Download-Options, X-XSS-Protection)

// Routers
app.use('/', [albumsRouter, artistsRouter]);

// When / is accessed, send a response
app.get('/', (req: Request, res: Response) => {
    res.send('Hello World from TypeScript!'); // response to send
});

// Start the app to listen on port 3000
// Port to listen on
const port = process.env.PORT;
app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`); 
    console.log(process.env.GREETING);
});