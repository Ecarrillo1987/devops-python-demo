# Usamos una imagen base de Python
FROM python:3.11.3

# Establecer directorio de trabajo en el contenedor
WORKDIR /app

# Copiar los archivos del proyecto
COPY . .

# Copiar el archivo .env al contenedor
#COPY .env /app/.env

# Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Exponer el puerto de Django
EXPOSE 8000

# Definir las variables de entorno en Docker
ENV DJANGO_SECRET_KEY=${DJANGO_SECRET_KEY}
ENV DATABASE_NAME=${DATABASE_NAME}
ENV ALLOWED_HOSTS=${ALLOWED_HOSTS}

# Agregar un healthcheck para verificar si el servidor está corriendo
HEALTHCHECK --interval=30s --timeout=10s --start-period=10s \
  CMD curl -f http://localhost:8000/api/ || exit 1

# Comando de entrada para ejecutar migraciones y arrancar el servidor
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
