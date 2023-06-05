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

const DiplomaciasController={
    getDiplomacias,
    getDiplomacia
}

export default DiplomaciasController