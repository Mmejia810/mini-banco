# Imagen base más ligera
FROM openjdk:21-jre-slim

WORKDIR /app

# Copiar el JAR
COPY target/mini-banco-1.0-SNAPSHOT.jar app.jar

# Exponer el puerto que usaremos para health check
EXPOSE 8080

# CMD modificado para mantener la aplicación corriendo
# Usamos un pequeño wrapper de Java que mantiene el contenedor activo
CMD ["sh", "-c", "java -jar app.jar & while true; do sleep 30; done"]
