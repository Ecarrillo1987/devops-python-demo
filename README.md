# DevOps Demo - Python API

## 📌 Descripción

Este proyecto es una API desarrollada en Django y desplegada en un clúster de Kubernetes utilizando GitHub Actions para CI/CD. La aplicación maneja usuarios y permite operaciones CRUD a través de una API REST.

## 🚀 Arquitectura del Proyecto

El proyecto sigue una estructura modular con los siguientes componentes:

- **Django API**: Aplicación principal escrita en Django con DRF.
- **Docker**: Contenedoriza la aplicación para facilitar despliegues.
- **Kubernetes (GKE)**: Orquestación y gestión de la API en Google Kubernetes Engine.
- **GitHub Actions**: Pipeline de CI/CD para construcción, pruebas y despliegue automático.

## 📜 Diagrama de Arquitectura

```mermaid
graph TD;
    Dev[Desarrollador] -->|Push a GitHub| GitHubActions[GitHub Actions]
    GitHubActions -->|Build & Push Docker Image| DockerHub
    DockerHub -->|Pull Image| Kubernetes[GKE Cluster]
    Kubernetes -->|Expose API| LoadBalancer
    LoadBalancer -->|Requests| API[Django REST API]
Configuración del Entorno
📌 Requisitos Previos

    Docker
    Kubernetes (kubectl y minikube o GKE)
    Python 3.11+
    Google Cloud SDK configurado con permisos necesarios

🛠 Instalación y Configuración

Clonar el repositorio:
git clone https://github.com/tu-usuario/devops-python-demo.git
cd devops-python-demo

Crear un archivo .env basado en el siguiente ejemplo:
DJANGO_SECRET_KEY='django-insecure-wc2i2*6^17$9!u+(u66@q_rg)++n1x-^(0-$3yz2f(n=_-o*7='
DATABASE_NAME=db.sqlite3
ALLOWED_HOSTS=34.138.156.59,localhost,127.0.0.1

Construir la imagen localmente:
docker build -t devops-demo:v1 .

Despliegue en Kubernetes

    Aplicar ConfigMap y Secret:
kubectl apply -f k8s/configmap.yaml
kubectl apply -f k8s/secret.yaml

    Desplegar la API:

kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

    Obtener la URL del servicio:

kubectl get svc devops-service

✅ Pruebas y Validación

Puedes probar la API en la siguiente URL pública:

http://34.138.156.59/api/

Para listar los usuarios:

curl http://34.138.156.59/api/users/

Para crear un usuario:

curl -X POST http://34.138.156.59/api/users/ -H "Content-Type: application/json" -d '{"name": "Test User", "dni": "123456789"}'

📌 Nota: Reemplaza 34.138.156.59 con la IP de tu servicio en Kubernetes si cambia. 🚀


### 📌 Pasos siguientes:
1. Guarda este contenido en el archivo `README.md` dentro de tu repositorio.
2. Confirma que la URL de acceso (`http://34.138.156.59/api/`) esté funcionando.
3. Si necesitas, sube una imagen con el diagrama generado en draw.io o Excalidraw en lugar del código Mermaid.

¡Con esto tu documentación está completa y lista para compartir! 🚀

