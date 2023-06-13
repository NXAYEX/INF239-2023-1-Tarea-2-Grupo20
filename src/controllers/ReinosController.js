import prisma from '../prismaClient.js'

//GET completo
const getReinos=async (req,res)=>{
    const reinos = await prisma.reinos.findMany()
      res.json(reinos)
}
//GET unico
const getReinoById=async (req,res)=>{
    const { id } = req.params
      const reino= await prisma.reinos.findUnique({
          where: {
              id: Number(id)
          }
      })
      res.json(reino)
}

//CREATE [POST]
const postReino = async (req, res) => {
    const { nombre, ubicacion,superficie } = req.body;
    const nuevoreino = await prisma.reinos.create({
        data: {
            nombre,
            ubicacion,
            superficie
        }
    })
    res.json(nuevoreino)
    /*
    if(nuevoreino!=error){
        res.json(nuevoreino)
    }else{
        res.status(500).json({error: "hubo un error al Crear un Reino"})
    }*/
}
//[PUT]
const putReino= async(req,res)=>{
    const { id }=req.params;
    const actureino= await prisma.reinos.update({
        where: { id: Number(id) },
        data: {nombre, ubicacion, superficie},
        include: {diplomacias:true}
    })
    if (nombre && ubicacion && superficie){
        res.json(actureino);
    }
    else{
        res.status(500).json({error: "hubo un error al actualizar"});
    }
    

}
//[DELETE]
const deleteReino= async(req,res)=>{
    const { id } = req.params;
    const reinoBorrado = await prisma.reinos.delete({
        where: { id: Number(id) },
    })
    res.json(reinoBorrado);
}
const ReinosController={
    getReinos,
    getReinoById,
    postReino,
    putReino,
    deleteReino

}
export default ReinosController