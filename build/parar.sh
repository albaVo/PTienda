docker-compose -f docker-compose.yml down
docker rmi apitienda:latest 
docker image prune

sudo rm -rf postgres
sudo rm -rf web