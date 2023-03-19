
echo "Desplegando la app de pTienda"

# docker-compose -f docker-compose.yml down
docker stop apiTiendaNest
docker rm apiTiendaNest


docker-compose -f docker-compose.yml build
docker-compose -f docker-compose.yml up -d
# docker exec -it apiNest /bin/bash