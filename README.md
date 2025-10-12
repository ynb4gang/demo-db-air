# Demo PostgreSQL Database in Docker

This repository provides a ready-to-use Docker environment for running the **PostgresPro Demo Database** (`demo-20250901-2y.sql`) with **pgAdmin 4** for visual interaction.

---

## 🚀 Features

- **PostgreSQL 16** preloaded with the [PostgresPro demo database](https://postgrespro.ru/education/demodb)
- **pgAdmin 4** web interface for easy browsing
- Automatic database download and initialization during build
- Works out of the box on macOS, Linux, and Windows

---

## 🧱 Project Structure

```
.
├── Dockerfile               # Builds PostgreSQL image and loads demo data
├── docker-compose.yml       # Defines PostgreSQL + pgAdmin services
└── README.md                # This file
```

---

## ⚙️ Setup Instructions

### 1️⃣ Build and Run

```bash
docker-compose up --build
```

This will:
- Build a custom PostgreSQL image
- Download and unpack `demo-20250901-2y.sql.gz`
- Initialize the demo database
- Start **pgAdmin 4**

> 🕐 The first build might take a few minutes (it downloads and loads the demo dataset).

---

### 2️⃣ Access pgAdmin

Once started:

- 🌐 Open: [http://localhost:8080](http://localhost:8080)
- 🧑‍💻 Login credentials:
  - **Email:** `admin@demo.com`
  - **Password:** `admin`

> If you see the pgAdmin login screen, the environment is running correctly.

---

### 3️⃣ Connect to the Database

In pgAdmin, the server connection is preconfigured.  
If you need to connect manually, use the following settings:

| Parameter      | Value              |
|----------------|--------------------|
| Host           | `demo-postgres`    |
| Port           | `5432`             |
| User           | `postgres`         |
| Password       | `postgres`         |
| Database       | `demo`             |

---

## 🧹 Clean Up

To remove containers, network, and volumes:

```bash
docker-compose down -v
```

---

## 📦 Publishing to Docker Hub

You can package and share this environment using Docker Hub.

1. Log in to Docker Hub:
   ```bash
   docker login
   ```

2. Tag the image:
   ```bash
   docker tag demo-db_air-postgres <your_dockerhub_username>/demo-db:latest
   ```

3. Push the image:
   ```bash
   docker push <your_dockerhub_username>/demo-db:latest
   ```

Then others can run it with:
```bash
docker run -d -p 5432:5432 <your_dockerhub_username>/demo-db:latest
```

---

## 🧠 Notes

- If you rebuild the container often, Docker caching will prevent re-downloading the demo file each time.
- The `.sql` file is automatically fetched from the official site.
- Tested on **macOS (Apple Silicon)** and **Linux Ubuntu 22.04**.

---

## 📚 Credits

Demo data provided by **PostgresPro**:  
🔗 [https://postgrespro.ru/education/demodb](https://postgrespro.ru/education/demodb)

---

**Enjoy exploring the Postgres demo database! 🐘**
