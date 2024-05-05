# TLA Docker
A docker container to run TLC. 

From the directory hosting your TLA+ files, run: 

```
docker run -v $(pwd):/model tombert/tla DieHard.tla
```


