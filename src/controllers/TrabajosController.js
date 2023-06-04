import prisma from '../prismaClient.js'

//GET COMPLETO
const getTrabajos = async(req , res)=>{
      // get para obtener todos los datos de la tabla trabajos
    const trabajos = await prisma.trabajos.findMany()
    res.json(trabajos)
}
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
//DELETE
const TrabajosController = {
    getTrabajos,
    getTrabajoById,
    postTrabajos
}

export default TrabajosController