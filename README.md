1) Create your image directory, e.g.

mkdir nomachine

2) Copy content of the Dockerfile below to: nomachine/Dockerfile.

Adapt the Dockerfile to your needs.

3) Copy content of the wrapper script below to: nomachine/nxserver.sh.

and set executable permissions:

chmod +x nomachine/nxserver.sh

4) Build the image:

docker build -t=nomachine nomachine

5) Run the container:

docker run -d -p 4000:4000  nomachine

Set a different port if necessary (see points d and e below).

You can specify multiple ports by reiterating the -p option, e.g.

docker run -d -p 4000:4000 -p 22:22 nomachine

