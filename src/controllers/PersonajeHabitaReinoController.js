import prisma from '../prismaClient.js'

//GET completo
const getPersonajes_Habitan=async (req,res)=>{
    const personajes_habitan = await prisma.personaje_habita_reino.findMany()
      res.json(personajes_habitan)
}
//GET unico
const getPersonaje_Habita=async (req,res)=>{
    const { id } = req.params
      const personaje_habita = await prisma.personaje_habita_reino.findUnique({
          where: {
              id: Number(id)
          }
      })
      res.json(personaje_habita)
}

//CREATE [POST]
const postHabitaReino = async (req, res) => {
    const { id_personaje,id_reino,fecha_registro,es_gobernante } = req.body
    const fechaRegistro = new Date(req.body.fecha_registro);
    const nuevo = await prisma.personaje_habita_reino.create({
        data: {
            id_personaje,
            id_reino,
            fecha_registro:fechaRegistro,
            es_gobernante
        },
    })
    res.json(nuevo);
}

//[PUT]
const putHabitaReino= async(req,res)=>{
    const {id_personaje }=req.params;
    const { id_reino,fecha_registro,es_gobernante } = req.body
    const fechaRegistro = new Date(req.body.fecha_registro);
    const actuPersonaje= await prisma.personaje_habita_reino.update({
        where: { id: Number(id_personaje) },
        data: { 
            id_reino,
            fecha_registro:fechaRegistro,
            es_gobernante
        }
    })
    if (actuPersonaje!=null){
        res.json(actuPersonaje);
    }
    else{
        res.status(500).json({error: "hubo un error al actualizar"});
    }
    

}
//[DELETE]
const habitaBorrado= async(req,res)=>{
    const { id_personaje } = req.params;
    const habitaBorrado = await prisma.personaje_habita_reino.delete({
        where: { id: Number(id_personaje) },
    })
    if(habitaBorrado!=null){
        res.json(habitaBorrado);
    }
    else{
        res.status(400).json({error: "No se ha eliminado,revisa si te equivocaste"});
    }
    
}
//importar
const PersonajeHabitaReinoController={
    getPersonajes_Habitan,
    getPersonaje_Habita,
    postHabitaReino,
    putHabitaReino,
    habitaBorrado
    
}

export default PersonajeHabitaReinoController