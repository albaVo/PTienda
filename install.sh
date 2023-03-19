
echo "Desplegando la app de pTienda"

# docker-compose -f docker-compose.yml down


# docker-compose -f docker-compose.yml build
# docker-compose -f docker-compose.yml up -d
# docker exec -it apiNest /bin/bash

cd /var/lib/jenkins/workspace/Proyectos/Job-pTienda/api_nest/

export $(cat .env | xargs)

docker-compose -f /var/lib/jenkins/workspace/Proyectos/Job-pTienda/ptienda/api_nest/docker-compose.yml build --no-cache

docker-compose -f /var/lib/jenkins/workspace/Proyectos/Job-pTienda/ptienda/api_nest/docker-compose.yml up -d