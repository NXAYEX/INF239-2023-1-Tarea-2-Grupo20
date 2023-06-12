import prisma from '../prismaClient.js'

//GET completo
const getDefensas = async (req , res) => {
    const defensas = await prisma.defensas.findMany()
    res.json(defensas)
}
const getDefensa = async (req, res) => {
    const { id } = req.params
    const defensa= await prisma.defensa.findUnique({
        where: {
            id: Number(id)
        }
    })
    res.json(defensa)
}
//CREATE [POST]
const postDefensas = async (req, res) => {
    const {defensa} = req.body;
    const nuevodefensa = await prisma.defensas.create({
        data: {
            defensa
        },
    })
    res.json(nuevodefensa);
}
//PUT ACTUALIZAR
const putDefensas= async(req,res)=>{
    const { id }=req.params;
    const {defensa}=req.body;
    const actudefensas= await prisma.karts.update({
        where: { id: Number(id) },
        data:req.body})

    if (defensa){
        res.json(actudefensas);
    }
    else{
        res.status(500).json({error: "hubo un error al actualizar"});
    }
}
//[DELETE]
const deleteDefensas= async(req,res)=>{
    const { id } = req.params;
    const borrardefensa = await prisma.defensas.delete({
        where: { id: Number(id) },
    })
    if(borrardefensa!=null){
        res.json(borrardefensa);
    }
    else{
        res.status(400).json({error: "No se ha eliminado,revisa si te equivocaste"});
    }
    
}
const DefensaController ={
    getDefensas,
    getDefensa,
    postDefensas,
    putDefensas,
    deleteDefensas

}
export default DefensaController