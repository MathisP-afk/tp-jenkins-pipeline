#!/bin/bash
mkdir -p tempdir
mkdir -p tempdir/templates
mkdir -p tempdir/static

cp sample_app.py tempdir/.
# On ignore les copies de templates/static s'ils n'existent pas pour éviter les erreurs
# cp -r templates/* tempdir/templates/.
# cp -r static/* tempdir/static/.

echo "FROM python" > tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile
echo "COPY sample_app.py /home/myapp/" >> tempdir/Dockerfile
echo "EXPOSE 5050" >> tempdir/Dockerfile
echo "CMD python3 /home/myapp/sample_app.py" >> tempdir/Dockerfile

cd tempdir
docker build -t sampleapp .

# On supprime l'ancien conteneur s'il existe pour éviter le conflit
docker stop samplerunning || true
docker rm samplerunning || true

docker run -t -d -p 5050:5050 --name samplerunning sampleapp
docker ps -aje pe
