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


const ReinosController={
    getReinos,
    getReinoById
}
export default ReinosController