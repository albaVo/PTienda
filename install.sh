docker-compose -f docker-compose.yml down
docker rmi apitienda:latest 
docker image prune

sudo rm -rf postgres
sudo rm -rf web


echo "Desplegando la app de pTienda"

docker-compose -f docker-compose.yml build
docker-compose -f docker-compose.yml up -d
# docker exec -it apiNest /bin/bash