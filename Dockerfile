FROM eclipse-temurin:21-jre

WORKDIR /app

COPY target/mini-banco-1.0-SNAPSHOT.jar app.jar

EXPOSE 8080

# Mantener la app corriendo (solo para CI/CD con Act)
CMD ["sh", "-c", "java -jar app.jar & while true; do sleep 30; done"]
