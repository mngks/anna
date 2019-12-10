import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initUserLocation } from './init_userlocation';
import { initForm } from '../components/category_choice';

initMapbox();
initUserLocation();
initForm();
