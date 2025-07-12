# Flask + MySQL application

## 🐳 Initializing the Dockerfile

After bringing our source code into the working directory locally, we create a `Dockerfile` with simple instructions to build our Docker image.

We:

- Choose a lightweight Python image to reduce build time (since this is a simple Flask app),
- Set the working directory inside the container,
- Copy the source code into that directory,
- Install Flask dependencies,
- Expose port `5002` for the application to listen on,
- Provide the command to run the app when the container starts.


![Dockerfile](/hello_flask/images/dockerfile1.png)

---

## Creating an Image and Container for the Python App

With the `Dockerfile` ready, we now build the Docker image:

```bash
docker build -t hello_flask .
```

Then, create a container from the image:

```bash
docker run -d --name hello-flask -p 5002:5002 hello_flask
```

- `-d` runs the container in detached (background) mode.
- `--name` assigns a name to the container.
- `-p 5002:5002` maps the container’s port 5002 to the host’s port 5002.

![Image](/hello_flask/images/image.png)

---

## Creating a Network and MySQL Database Container

Docker networks allow containers to communicate by name instead of IP. To create a custom network:

```bash
docker network create my-custom-network
```

Next, we will connect the app and database to this network.

Now, to run a MySQL container:

```bash
docker run -d \
  --name mydb \
  --network my-custom-network \
  -e MYSQL_ROOT_PASSWORD=my-secret-pw \
  mysql:8.0
```

> The `MYSQL_ROOT_PASSWORD` environment variable is required for MySQL to initialize and secure root access.

We must update our Dockerfile to include `mysqlclient` in the `RUN` line above. Then rebuild the image:

```bash
docker build -t hello_flask .
```

Lastly, run the Flask container on the same network:

```bash
docker run -d --name hello-flask --network my-custom-network -p 5002:5002 hello_flask
```

Now, your Flask app can connect to the database using `mydb` as the hostname. We can now go to localhost:5002 on our browser and see our Hello World script with our MySQL version.

![Final](/hello_flask/images/final.png) 

---

## Summary

- `Dockerfile` builds a lightweight Flask image with MySQL support.
- Image and containers are created using `docker build` and `docker run`.
- A custom Docker network allows easy communication between app and DB.
- MySQL container is initialized with a secure root password.
- We can access our web application on localhost:5002.

---

