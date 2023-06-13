import prisma from '../prismaClient.js'

//GET Personajes
const getPersonajes = async (req , res) => {
    // get para obtener todos los datos de la tabla personajes
    const personajes = await prisma.personajes.findMany()

    res.json(personajes)
}
const getPersonajesById = async (req, res) => {
    const { id } = req.params;
    const personaje = await prisma.personajes.findUnique({
        where: {id: Number(id)},
    })
    if(personaje!=null){
        res.json(personaje);
    }else{
        res.status(404).json({error:"Personaje No encontrado"});
    }
    
}

//CREATE [POST]
const createPersonaje = async (req, res) => {
    const { nombre, fuerza, fecha_nacimiento, objeto } = req.body
    const fecha_Nacimiento = new Date(req.body.fecha_nacimiento);
    const nuevoPersonaje = await prisma.personajes.create({
        data: {
            nombre,
            fuerza,
            fecha_nacimiento,
            fecha_nacimiento:fecha_Nacimiento,
            objeto
        },
    })
    if(nuevoPersonaje!=null){
        res.json(nuevoPersonaje);
    }else{
        res.status(500).json({ error: "Error al crear el personaje" });
    }
    
}

//[PUT]
const putPersonaje= async(req,res)=>{
    const { id }=req.params;
    const {nombre, fuerza,fecha_nacimiento,objeto}= req.body;
    const fecha_Nacimiento = new Date(req.body.fecha_nacimiento);
    const actuPersonaje= await prisma.personajes.update({
        where: { id: Number(id) },
        data: { 
            nombre,
            fuerza,
            fecha_nacimiento:fecha_Nacimiento,
            objeto
        }
    })
    if (nombre && fuerza && fecha_nacimiento){
        res.json(actuPersonaje);
    }
    else{
        res.status(500).json({error: "hubo un error al actualizar"});
    }
    

}
//[DELETE]
const personajeBorrado= async(req,res)=>{
    const { id } = req.params;
    const personajeBorrado = await prisma.personajes.delete({
        where: { id: Number(id) },
    })
    if(personajeBorrado!=null){
        res.json(personajeBorrado);
    }
    else{
        res.status(400).json({error: "No se ha eliminado,revisa si te equivocaste"});
    }
    
}
          
const PersonajesController = {
    getPersonajes,
    getPersonajesById,
    createPersonaje, 
    putPersonaje,
    personajeBorrado
    
}

export default PersonajesController