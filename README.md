# Docker-Benchmark-Base
This repository targets the analysis of the performance of different programming languages ​​when solving the same problem using containers with solutions in multiple languages,  and compares the execution times.

## Instructions for use (Docker Play)
Add a new instance and clone the repository:
```
git clone https://github.com/angelicampp/Docker-Benchmark-Base.git
```

then, move to the folder:
```
cd Docker-Benchmark-Base/
```

once in the folder, create the image:
```
docker build --no-cache -t dind .
```

after creating the image, start the docker DinD container: 
```
docker run --privileged --name dind-container -d dind
```

Finally, run the bash script to start building all the programs: (this might take 1-2 minutes)
```
docker exec -it dind-container sh -c "bash /app/script.sh"
```

After running the script, you may want to see the outputs of the programs:
```
docker exec -it dind-container sh -c "cat /app/Docker-Benchmark/Python/output.txt"
docker exec -it dind-container sh -c "cat /app/Docker-Benchmark/Java/output.txt"
docker exec -it dind-container sh -c "cat /app/Docker-Benchmark/Javascript/output.txt"
docker exec -it dind-container sh -c "cat /app/Docker-Benchmark/Ruby/output.txt"
docker exec -it dind-container sh -c "cat /app/Docker-Benchmark/Go/output.txt"
```

## Solutions Repository Link

- [Repository Link](https://github.com/angelicampp/Docker-Benchmark.git)

## Authors

- [@jesus2801](https://github.com/jesus2801)
- [@angelicampp](https://github.com/angelicampp)

## License

[MIT](https://choosealicense.com/licenses/mit/)
