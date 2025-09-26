# Usar OpenJDK 21 como imagen base
FROM openjdk:21-jre-slim

# Información del mantenedor
LABEL maintainer="taller-ci-cd"
LABEL description="Mini Banco Application"

# Crear directorio de trabajo
WORKDIR /app

# Copiar el JAR generado por Maven (Spring Boot)
# El nombre debe coincidir con tu artifactId y version del pom.xml
COPY target/mini-banco-1.0-SNAPSHOT.jar app.jar

# Exponer el puerto 8080 (puerto por defecto de Spring Boot)
EXPOSE 8080

# Configurar variables de entorno (opcional)
ENV JAVA_OPTS=""
ENV SERVER_PORT=8080

# Crear un usuario no-root para mayor seguridad
RUN addgroup --system appgroup && adduser --system --group appuser
RUN chown -R appuser:appgroup /app
USER appuser

# Healthcheck (opcional - útil para contenedores en producción)
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8080/actuator/health || exit 1

# Comando para ejecutar la aplicación
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]