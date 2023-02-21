
# echo "Tareas (por etapas) del pipeline JenkinsFile..."

# echo "Instalando la tienda App PC Componentes"
# echo "Descargar respositorio de AppTienda"
# echo "Actualizar versiones de los dockerfiles en Docker Hub..."
# echo "Realizaar el build del proyecto..."
# echo "Fases del testeo..."
# echo "Matar los contenedores en ejecución de la versión anterior..."
# echo "Levantar los nuevos contenedores actualizados..."

echo "Desplegando la app de pTienda"

docker-compose -f docker-compose.yml build
docker-compose -f docker-compose.yml up -d