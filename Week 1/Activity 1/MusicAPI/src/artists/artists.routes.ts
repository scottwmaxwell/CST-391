import { Request, Response, Router } from 'express';
import { getArtists } from './artists.controller';

const router = Router();
router
    .route('/artists')
    .get(getArtists);

export default router;