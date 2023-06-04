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
        where: {
            id: Number(id)
        }
    })
    res.json(kart)
}

const KartsController = {
    getKarts,
    getkartsById
}

export default KartsController