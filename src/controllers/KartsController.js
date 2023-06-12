import prisma from '../prismaClient.js'
//GET
const getKarts = async (req , res) => {
    // get para obtener todos los datos de la tabla Karts
    const karts = await prisma.karts.findMany()
    res.json(karts)
}
const getkartsById = async (req, res) => {
    const { id } = req.params
    const kart = await prisma.karts.findUnique({
        where: {id: Number(id)}
    })
    res.json(kart)
}
//post
const postKarts= async (req,res)=>{
    const {modelo,color, velocidad_max,id_personaje}=req.body;
    const newKarts= await prisma.karts.create({
        data:{
            modelo,color, velocidad_max,id_personaje
        } 
    })
    res.json(newKarts)
}
//PUT ACTUALIZAR
const putKarts= async(req,res)=>{
    const { id }=req.params;
    const actuKarts= await prisma.karts.update({
        where: { id: Number(id) },
        data:req.body
    })
    if (modelo && color && velocidad_max ){
        res.json(actuKarts);
    }
    else{
        res.status(500).json({error: "hubo un error al actualizar"});
    }
}
const deleteKarts= async (req,res)=>{
    const { id } = req.params;
    const kartsBorrado = await prisma.karts.delete({
    where: { id: Number(id) },
    })
    if(!kartsBorrado){
        res.json(kartsBorrado);
    }else{
        res.status(400).json({error: "No se ha eliminado,revisa si te equivocaste"});
    }
    
}
const KartsController = {
    getKarts,
    getkartsById,
    postKarts,
    putKarts,
    deleteKarts
}

export default KartsController