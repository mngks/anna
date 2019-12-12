import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initUserLocation } from './init_userlocation';
import { initForm } from '../components/category_choice';
import { initStarRating } from '../plugins/init_star_rating';

initStarRating();
initMapbox();
initUserLocation();
initForm();
