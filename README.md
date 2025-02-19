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

