import prisma from '../prismaClient.js'

//GET Personajes
const getPersonajes = async (req , res) => {
    // get para obtener todos los datos de la tabla personajes
    const personajes = await prisma.personajes.findMany()
    res.json(personajes)
}
const getPersonajesById = async (req, res) => {
    const { id } = req.params
    const personaje = await prisma.personajes.findUnique({
        where: {
            id: Number(id)
        }
    })
    res.json(personaje)
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
        }
    })
    res.json(nuevoPersonaje)
}

//[PUT]
const PutPersonaje= async(req,res)=>{

}
//[DELETE]
const PersonajeBorrado= async(req,res)=>{
    const PersonajeBorrado= await prisma.personajes.delete({
        where: parseInt(req.params.id)
    })
    res.json(PersonajeBorrado)
}


const personajeKarts = async (req, res) => {
    const { id } = req.params
    const user = await prisma.user.findUnique({
        where: {
            id: Number(id)
        },
        include: {
            posts: true
        }
    })
    res.json(user)
}

           
const PersonajesController = {
    getPersonajes,
    getPersonajesById,
    createPersonaje, 
    
}

export default PersonajesController