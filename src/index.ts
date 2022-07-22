import { IDetailsPerson } from './models/interfacesdetails'
import { PrismaClient, Prisma } from '@prisma/client'

const prisma = new PrismaClient()


async function create() {
    const details: IDetailsPerson = {
        stock: [ {
            id: "123", description: '', price: 0, qty: 0
        }],
        billings: []
    }
    const person = {
        name: 'Lucas',
        document: '1123',
        pathPhoto: '',
        status: true,
        details: JSON.stringify(details)

    }
    await prisma.person.create({ data: person })

}

// create()
//     .then(res => {
//         console.log('ok: ', res);
//     })
//     .catch(err => console.log('falha', err))
//     .finally(async () => {
//         console.log('finalizou o comando');
//         await prisma.$disconnect();
//     })


prisma.person.findUnique({ 
    where: { id: '27604c74-12e3-42f0-a9d6-d432cb286b22'}
})
    .then(res =>  {
        const d: string = res?.details! as string;
        console.log('json: ', JSON.parse(d))

    })
    .catch(err => console.log('falhou', err))
    .finally(async () => {
         console.log('finalizou o comando');
         await prisma.$disconnect();
     })

