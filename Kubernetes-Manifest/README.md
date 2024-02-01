# Kubernetes Manifests for Project-App

## Deployment (deployment.yml)

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: project-app
  namespace: abu-nemr
spec:
  replicas: 1
  selector:
    matchLabels:
      app: project-app
  template:
    metadata:
      labels:
        app: project-app
    spec:
      containers:
        - name: container
          image: docker.io/amrabunemr98/test:build-${BUILD_NUMBER}-app
          ports:
            - containerPort: 8080
          resources:
            limits:
              cpu: "0.5"
              memory: "512Mi"
            requests:
              cpu: "0.1"
              memory: "128Mi"
          volumeMounts:
            - name: pvc
              mountPath: /var/www/html

      volumes:
        - name: pvc
          persistentVolumeClaim:
            claimName: project-pvc
