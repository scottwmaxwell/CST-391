import { Router } from 'express';
import { getAlumbs } from './albums.controller';

const router = Router();
router
    .route('/albums')
    .get(getAlumbs);

export default router;