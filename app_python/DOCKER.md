# Docker best practices used

## 1. Use appropriate image
A specific image with python version 3.9 was used to write the Dockerfile. Additionaly `alpine` version of the image was used

## 2. Copy only necessary files
`.dockerignore` file is used to reduce the size of build context and so reduce the time to build the image as well as reduce the size of the final container


## 3. Dockerfile instructions order
To use the cached layers as much as possible the instructions are placed in a special order such that the first created layers are unlikely to change.


## 4. Multistage Dockerfile
A separate container is used to install `poetry` and export `requirements.txt`. This allows to not carry `poetry`'files to the final app container and keep it very light
