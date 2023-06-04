import { parse } from 'dotenv'
import prisma from '../prismaClient.js'
//GET
const getPersonajesTrabajo =async (req, res)=>{
    const personajesConTrabajos= await prisma.personaje_tiene_trabajo.findMany()
    res.json(personajesConTrabajos)
}

const getPersonajesTrabajoById = async(req , res)=>{
    const personajeConTrabajo=await prisma.personaje_tiene_trabajo.findUnique({
        where :{
            id : parseInt(req.params.id)
        }
    })
}

const PersonajeTrabajoController = {
    getPersonajesTrabajo,
    getPersonajesTrabajoById
}

export default PersonajeTrabajoController