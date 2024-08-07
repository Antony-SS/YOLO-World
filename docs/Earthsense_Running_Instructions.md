**Clone my (Antony’s) Fork of the Yolo-World Repo**

```json
git clone --recursive https://github.com/Antony-SS/YOLO-World.git
```

**Run the docker compose**

```json
docker compose -f docker-compose.yml up --build --force-recreate
```

**Open a new terminal, exec in**

```json
docker exec -it yolo /bin/bash
```

<aside>
💡 The yolo-world repo is poorly maintained, there is a lot of sloppy and broken code.  I did enough to get the demos running on my end, but any novel development you do will inevitably involve working through bugs in the code base.  

Additionally there may be one or two dependencies that I missed in the dockerfile that you will have to install.

</aside>