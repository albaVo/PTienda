import { ProductosCardList, ProductosList } from "@/components/productos"
import { useProductos } from "@/hooks/useProductos"
import { PublicLayouts } from "@/layouts"

const IndexLibrosPage = () => {
    const { productos, isLoading } = useProductos('/productos')
    console.log("l=", isLoading, "p=", productos)
  
    return (
        <PublicLayouts>
            <h2 id="seccion">Sección de Productos</h2>
            {/* <ProductosCardList productos={productos}/> */}
            <ProductosList productos={productos}/>
        </PublicLayouts>
    )
}

export default IndexLibrosPage
