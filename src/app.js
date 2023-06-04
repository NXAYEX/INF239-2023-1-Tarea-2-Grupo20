import express from 'express';
import UsersController from './controllers/UsersController.js';
import morgan from 'morgan';
import PersonajesController from './controllers/PersonajesController.js';
import KartsController from './controllers/KartsController.js';
import PersonajeTrabajoController from './controllers/PersonajeTrabajoController.js';
import TrabajosController from './controllers/TrabajosController.js';
import PersonajeHabitaReinoController from './controllers/PersonajeHabitaReinoController.js';
import ReinosController from './controllers/ReinosController.js';

const ENV = process.env;
const app = express();

//middleware
app.use(express.json());
app.use(morgan('dev'));

//endpoints(Routes)
app.get('/users', UsersController.getUsers)
app.get('/users/:id', UsersController.getUserById)
app.post('/users', UsersController.createUser)
app.get('/users/:id/posts', UsersController.usersPosts)
//ROUTES GET Tablas completas
app.get("/api/personajes",PersonajesController.getPersonajes)
app.get("/api/karts",KartsController.getKarts)
app.get("/api/personaje_tiene_trabajo", PersonajeTrabajoController.getPersonajesTrabajo)
app.get("/api/trabajos",TrabajosController.getTrabajos)
app.get("/api/personaje_habita_reino",PersonajeHabitaReinoController.getPersonajes_Habitan)
app.get("/api/reinos",ReinosController.getReinos)
//GET por id
app.get("/api/personajes/:id",PersonajesController.getPersonajesById)
app.get("/api/karts/:id",KartsController.getkartsById)
app.get("/api/personaje_tiene_trabajo/:id",PersonajeTrabajoController.getPersonajesTrabajoById)
app.get("/api/trabajos/:id",TrabajosController.getTrabajoById)

app.get("/api/reinos/:id",ReinosController.getReinoById)
//RUTAS POST
app.post("/api/personajes",PersonajesController.createPersonaje)
app.post("/api/trabajos",TrabajosController.postTrabajos)
//==========================================================//
app.get('/', (req, res) => {
    res.json({ message: 'Hello World!!' });
})
app.get('/api',(req,res)=>{
    res.json("la api yey")
})
//==========================================================//


// 404 not found route
app.use((_, res) => {
    res.status(404).json({ message: 'Not found Crack!' });
})


//Init server
app.listen(3000, () => {
    console.log(`Server running on port ${ENV.API_PORT}`);
})
