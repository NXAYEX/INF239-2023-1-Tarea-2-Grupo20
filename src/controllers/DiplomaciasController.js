import prisma from '../prismaClient.js'

//GET completo
const getDiplomacias=async (req,res)=>{
    const diplomacias = await prisma.diplomacias.findMany()
      res.json(diplomacias)
}
//GET unico
const getDiplomacia=async (req,res)=>{
    const { id } = req.params
      const diplomacia= await prisma.diplomacias.findUnique({
          where: {
              id: Number(id)
          }
      })
      res.json(diplomacia)
}
//CREATE [POST]
const postDiplomacia = async (req, res) => {
    const { id_reino1,id_reino2,es_aliado } = req.body
    const nuevo = await prisma.diplomacias.create({
        data: {
            id_reino1,id_reino2,es_aliado
        },
    })
    res.json(nuevo);
}

//[PUT]
const putDiplomacia= async(req,res)=>{
    const { id }=req.params;
    const {id_reino2,es_aliado}= req.body;
    const actuDiplomacia= await prisma.diplomacias.update({
        where: { id: Number(id) },
        data: { id_reino2,es_aliado
        }
    })
    if (actuDiplomacia!=null){
        res.json(actuDiplomacia);
    }
    else{
        res.status(500).json({error: "hubo un error al actualizar"});
    }
    

}
//[DELETE]
const deleteDiplomacia= async(req,res)=>{
    const { id } = req.params;
    const borrar = await prisma.diplomacias.delete({
        where: { id: Number(id) },
    })
    if(borrar!=null){
        res.json(borrar);
    }
    else{
        res.status(400).json({error: "No se ha eliminado,revisa si te equivocaste"});
    }
    
}
const DiplomaciasController={
    getDiplomacias,
    getDiplomacia,
    postDiplomacia,
    putDiplomacia,
    deleteDiplomacia
}

export default DiplomaciasController