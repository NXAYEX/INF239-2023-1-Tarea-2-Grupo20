import { parse } from 'dotenv'
import prisma from '../prismaClient.js'
//GET
const getPersonajesTrabajo =async (req, res)=>{
    const personajesConTrabajos= await prisma.personaje_tiene_trabajo.findMany()
    res.json(personajesConTrabajos)
}
//GET ID
const getPersonajesTrabajoById = async(req , res)=>{
    const {id}= req.body;
    const personajeConTrabajo=await prisma.personaje_tiene_trabajo.findUnique({
        where :{
            id: Number(id_personaje)
        }
    })
}
//post
const postPersonajeTrabajo= async (req,res)=>{
    const {id_trabajo, id_personaje, fecha_inicio, fecha_termino}=req.body;
    const fechainicio = new Date(req.body.fecha_inicio);
    const fechaTermino = new Date(req.body.fecha_termino);
    const nuevo= await prisma.personaje_tiene_trabajo.create({
        data:{
            fecha_inicio:fechainicio,
            fecha_termino:fechaTermino,
            id_trabajo,
            id_personaje,
        } 
    })
    res.json(nuevo)
}
const putPersonajeTrabajo= async(req,res)=>{
    const { id_personaje }=req.params;
    const actupersonajeTrabajo= await prisma.personaje_tiene_trabajo.update({
        where: { id: Number(id_personaje) },
        data:{
            fecha_inicio,
            fecha_termino
        }
    })
    if (actupersonajeTrabajo!=null){
        res.json(actupersonajeTrabajo)
    }
    else{
        res.status(500).json({error: "hubo un error al actualizar"})
    }
}
const deletePersonajeTrabajo= async (req,res)=>{
    const { id_personaje } = req.params;
    const personatrabajoBorrado = await prisma.personaje_tiene_trabajo.delete({
    where: { id: Number(id_personaje) },
    })
    if(personatrabajoBorrado!=null){
        res.json(personatrabajoBorrado);
    }else{
        res.status(400).json({error: "No se ha eliminado,revisa si te equivocaste"});
    }
    
}
const PersonajeTrabajoController = {
    getPersonajesTrabajo,
    getPersonajesTrabajoById,
    postPersonajeTrabajo,
    putPersonajeTrabajo,
    deletePersonajeTrabajo
}

export default PersonajeTrabajoController