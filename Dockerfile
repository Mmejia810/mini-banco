# Imagen base más ligera
FROM eclipse-temurin:21-jre-jammy

WORKDIR /app

# Copiar el JAR construido
COPY target/mini-banco-1.0-SNAPSHOT.jar app.jar

# CMD simple
ENTRYPOINT ["java","-jar","app.jar"]
