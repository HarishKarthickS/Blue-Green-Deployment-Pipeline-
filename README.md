# 🚀 Blue-Green Deployment Pipeline with Zero Downtime

## 🌟 Overview
This project implements a **Blue-Green Deployment Strategy** using **Docker, Nginx, and PostgreSQL**. Two versions of a Node.js application (Blue and Green) run simultaneously, and traffic is dynamically switched using **Nginx** as a reverse proxy. A deploy script automates the switch, ensuring **zero downtime**. ⚡

## 📂 Project Structure
```
blue-green-deployment/
├── blue
│   ├── Dockerfile
│   ├── app.js
│   └── package.json
├── green
│   ├── Dockerfile
│   ├── app.js
│   └── package.json
├── nginx
│   ├── blue.conf
│   ├── green.conf
│   ├── default.conf  # (updated by deploy.sh)
│   └── Dockerfile
├── db
│   └── init.sql
├── scripts
│   └── deploy.sh
├── docker-compose.yml
└── README.md
```

## 🚀 Quick Start Guide

### 1️⃣ Clone the Repository
```bash
git clone <repository-url>
cd blue-green-deployment
```

### 2️⃣ Build and Start the Containers
```bash
docker-compose up --build -d
```

### 3️⃣ Access the Application
Open your browser and visit:
```
http://localhost
```
By default, it routes to the **Blue** service. 🎉

### 4️⃣ Switch Deployment
Switch to the **Green** service using:
```bash
./scripts/deploy.sh green
```
Switch back to **Blue**:
```bash
./scripts/deploy.sh blue
```

## 🛠 Components Breakdown
### 🔵 **Blue Service (blue/app.js)**
Node.js application running on port **4000**.

### 🟢 **Green Service (green/app.js)**
Node.js application running on port **5000**.

### ⚙️ **Nginx Reverse Proxy (nginx/default.conf)**
Routes traffic to the active deployment (Blue or Green).

### 🗄 **Database Initialization (db/init.sql)**
Prepares PostgreSQL with a sample dataset.

### 🤖 **Deploy Script (scripts/deploy.sh)**
Automates switching between Blue and Green deployments.

## 🔧 Technologies Used
- **Node.js (Express) ⚡**
- **PostgreSQL 🗄**
- **Nginx 🚦**
- **Docker & Docker Compose 🐳**
- **Shell scripting 🖥**

## ⚙️ How It Works (Zero-Downtime Deployment 🎬)

1️⃣ **Run both Blue and Green versions simultaneously** 🎭

2️⃣ **Nginx routes traffic to the active version (default: Blue)** 🚦

3️⃣ **Execute `deploy.sh` to switch versions seamlessly** 🔄

4️⃣ **Traffic shifts without downtime!** ⚡

## 🆘 Troubleshooting
- Make sure **Docker & Docker Compose** are installed 🐳
- Verify containers are running: `docker ps`
- Check logs for errors: `docker-compose logs`

## 📜 License
This project is licensed under the **MIT License**. Modify, enhance, and deploy fearlessly! 🚀

