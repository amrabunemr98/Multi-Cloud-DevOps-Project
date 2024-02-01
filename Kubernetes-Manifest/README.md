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
```
## Network Policy (network-policy.yml)
```
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: policy-app
  namespace: abu-nemr
spec:
  podSelector:
    matchLabels:
      app: project-app
  policyTypes:
    - Ingress
    - Egress
  ingress:
    - from:
      - podSelector:
          matchLabels:
            app: project-app
  egress:
    - to:
      - podSelector:
          matchLabels:
            app: project-app
```
## Persistent Volume Claim (pvc.yml)
```apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: project-pvc
  namespace: abu-nemr
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
  storageClassName: my-ebs
```
## Route (route.yml)
```
apiVersion: route.openshift.io/v1
kind: Route
metadata:
  name: route-app
  namespace: abu-nemr
spec:
  to:
    kind: Service
    name: svc-app
  port:
    targetPort: 8080
  wildcardPolicy: None
```
## Service (service.yml)
```
apiVersion: v1
kind: Service
metadata:
  name: svc-app
  namespace: abu-nemr
spec:
  selector:
    app: project-app
  ports:
    - protocol: TCP
      port: 8080
      targetPort: 8080
  type: ClusterIP
```

