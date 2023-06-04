import prisma from '../prismaClient.js'

//GET completo
const getPersonajes_Habitan=async (req,res)=>{
    const personajes_habitan = await prisma.personaje_habita_reino.findMany()
      res.json(personajes_habitan)
}
//GET unico
const getPersonaje_Habita=async (req,res)=>{
    const { id } = req.params
      const personaje_habita = await prisma.personaje_habita_reino.findUnique({
          where: {
              id: Number(id)
          }
      })
      res.json(personaje_habita)
}

//importar
const PersonajeHabitaReinoController={
    getPersonajes_Habitan,
    getPersonaje_Habita
}

export default PersonajeHabitaReinoController