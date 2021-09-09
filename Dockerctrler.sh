echo "Building Individual Dockerfiles"

cd vote
docker build -t kaushiktraining/vote-app .
cd ..
cd result
docker build -t kaushiktraining/result-app .
cd ..
cd worker
docker build -t kaushiktraining/worker-app .
cd ..

#Remove containers if any
docker rm -f redis db vote result worker

echo "Pushing Docker Images"

docker login --username="kaushiktraining" --password="kaushik12499"

docker push kaushiktraining/vote-app:latest
docker push kaushiktraining/result-app:latest
docker push kaushiktraining/worker-app:latest

docker logout

#echo " Initializing Containers"

docker run -d --name=redis redis
docker run -d --name=db -e POSTGRES_HOST_AUTH_METHOD=trust postgres:9.4
docker run -d --name=vote -p 5000:80 --link redis:redis kaushiktraining/vote-app
docker run -d --name=result -p 5001:80 --link redis:redis --link db:db kaushiktraining/result-app
docker run -d --name=worker --link redis:redis --link db:db kaushiktraining/worker-app
