import prisma from '../prismaClient.js'

//GET COMPLETO
const getTrabajos = async(req , res)=>{
      // get para obtener todos los datos de la tabla trabajos
    const trabajos = await prisma.trabajos.findMany()
    res.json(trabajos)
}
//get por id
const getTrabajoById = async (req, res) => {
    const { id } = req.params
    const trabajo = await prisma.trabajos.findUnique({
        where: {
            id: Number(id)
        }
    })
    res.json(trabajo)
}
//POST
const postTrabajos= async(req,res)=>{
    const nuevoTrabajo=await prisma.trabajos.create({
        data:{
            descripcion,
            sueldo
        }
    })
    res.json(nuevoTrabajo)
}
//PUT
const putTrabajos= async(req,res)=>{
    const { id }=req.params;
    const {descripcion, sueldo}= req.body;
    const actuTrabajos= await prisma.trabajos.update({
        where: { id: Number(id) },
        data: { 
            descripcion, 
            sueldo
        }
    })
    if (descripcion || sueldo){
        res.json(actuPersonaje)
    }
    else{
        res.status(500).json({error: "hubo un error al actualizar"})
    }
}
//DELETE
const deleteTrabajos= async (req,res)=>{
    const { id } = req.params
    const trabajoBorrado = await prisma.trabajos.delete({
    where: { id: Number(id) },
    })
    res.json(trabajoBorrado)
}
const TrabajosController = {
    getTrabajos,
    getTrabajoById,
    postTrabajos,
    putTrabajos,
    deleteTrabajos
}

export default TrabajosController