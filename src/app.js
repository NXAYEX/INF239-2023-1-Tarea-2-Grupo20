import express from 'express';
import UsersController from './controllers/UsersController.js';
import morgan from 'morgan';
import PersonajesController from './controllers/PersonajesController.js';
import KartsController from './controllers/KartsController.js';
import PersonajeTrabajoController from './controllers/PersonajeTrabajoController.js';
import TrabajosController from './controllers/TrabajosController.js';
import PersonajeHabitaReinoController from './controllers/PersonajeHabitaReinoController.js';
import ReinosController from './controllers/ReinosController.js';
import DefensaController from './controllers/DefensasController.js';
import DiplomaciasController from './controllers/DiplomaciasController.js';

const ENV = process.env;
const app = express();

//middleware
app.use(express.json());
app.use(morgan('dev'));

//ROUTES GET Tablas completas
app.get("/api/personajes",PersonajesController.getPersonajes)
app.get("/api/karts",KartsController.getKarts)
app.get("/api/personaje_tiene_trabajo", PersonajeTrabajoController.getPersonajesTrabajo)
app.get("/api/trabajos",TrabajosController.getTrabajos)
app.get("/api/personaje_habita_reino",PersonajeHabitaReinoController.getPersonajes_Habitan)
app.get("/api/reinos",ReinosController.getReinos)
app.get("/api/defensas",DefensaController.getDefensas)
app.get("/api/diplomacias",DiplomaciasController.getDiplomacias)
//GET por id
app.get("/api/personajes/:id",PersonajesController.getPersonajesById)
app.get("/api/karts/:id",KartsController.getkartsById)
app.get("/api/personaje_tiene_trabajo/:id",PersonajeTrabajoController.getPersonajesTrabajoById)
app.get("/api/trabajos/:id",TrabajosController.getTrabajoById)
app.get("/api/personajes_habita_reino", PersonajeHabitaReinoController.getPersonaje_Habita)
app.get("/api/reinos/:id",ReinosController.getReinoById)
app.get("/api/defensas/:id",DefensaController.getDefensa)
app.get("/api/diplomacias/:id",DiplomaciasController.getDiplomacia)
//================RUTAS POST==============//
app.post("/api/personajes",PersonajesController.createPersonaje)
app.post("/api/karts",KartsController.postKarts)
app.post("/api/personaje_tiene_trabajo",PersonajeTrabajoController.postPersonajeTrabajo)
app.post("/api/trabajos",TrabajosController.postTrabajos)
app.post("/api/personajes_habita_reino", PersonajeHabitaReinoController.postHabitaReino)
app.post("/api/defensas",DefensaController.postDefensas)
app.post("/api/reinos",ReinosController.postReino)
app.post("/api/diplomacias",DiplomaciasController.postDiplomacia)
//========RUTAS PUT===========//
app.put("/api/personajes/:id",PersonajesController.putPersonaje)
app.put("/api/karts/:id",KartsController.putKarts)
app.put("/api/personaje_tiene_trabajo/:id",PersonajeTrabajoController.putPersonajeTrabajo)
app.put("/api/trabajos/:id", TrabajosController.putTrabajos)
app.put("/api/personajes_habita_reino/:id", PersonajeHabitaReinoController.putHabitaReino)
app.put("/api/reinos/:id",ReinosController.putReino)
app.put("/api/defensas/:id",DefensaController.putDefensas)
app.put("/api/diplomacias/:id",DiplomaciasController.putDiplomacia)
//========RUTAS DELETE=============//
app.delete("/api/personajes/:id",PersonajesController.personajeBorrado)
app.delete("/api/karts/:id",KartsController.deleteKarts)
app.delete("/api/personaje_tiene_trabajo/:id",PersonajeTrabajoController.deletePersonajeTrabajo)
app.delete("/api/trabajos/:id",TrabajosController.deleteTrabajos)
app.delete("/api/personajes_habita_reino/:id", PersonajeHabitaReinoController.habitaBorrado)
app.delete("/api/reinos/:id",ReinosController.deleteReino)
app.delete("/api/defensas/:id",DefensaController.deleteDefensas)
app.delete("/api/diplomacias/:id",DiplomaciasController.deleteDiplomacia)
//==========================================================//
app.get('/', (req, res) => {
    res.json({ message: 'Hello World!!' });
})
app.get('/api',(req,res)=>{
    res.json("La Api :)")
})
//============Endpoints=================//
app.get("/api/top5personajesConMasFuerza",(req, res)=>{
    res.json({message:"top5personajesConMasFuerza"})
})
app.get("/api/personajeConMasKarts",(req, res)=>{
    res.json({message:"personajeConMasKarts"})
})
app.get("/api/cantidadHabitantes/<id reino>",(req, res)=>{
    res.json({message:"Cantidad de habitantes según id del reino"})
})
app.get("/api/gobernante",(req, res)=>{
    res.json({message:"se debe retornar un JSON en que se indiquen todos los gobernantes de todos los reinos"})
})
app.get("/api/gobernante/<id reino>",(req, res)=>{
    res.json({message:" se muestran los gobernantes de ese id reino en especifico"})
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
