# TLA Docker
A docker container to run TLC. 

From the directory hosting your TLA+ files, run: 

```
docker run -v $(pwd):/model tombert/tla DieHard.tla
```

This was based on https://github.com/talex5/tla but it was pretty heavily modified. More updates to come. 
