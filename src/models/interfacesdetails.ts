export interface IDetailsProduct {
    id: string
    description: string
    price: number
    qty: number
}

export interface IDetailsBilling {

    products: IDetailsProduct[]
    totals: { sum: number, qty: number }

}

export interface IDetailsPerson {

    stock: IDetailsProduct[]
    billings: number[]


}

