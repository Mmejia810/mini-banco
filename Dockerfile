FROM eclipse-temurin:21-jre

WORKDIR /app

# Copiar el JAR (se construye en el workflow)
COPY target/*.jar app.jar

# Comando simple que muestra un mensaje y sale
CMD ["java", "-jar", "app.jar"]