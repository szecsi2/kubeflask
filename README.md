<h2># kubeflask</h2>

<p>Install Minikube</p>

```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo apt-get install -y apt-transport-https
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
kubectl get po -A
minikube dashboard 
```

<p>Installing HELM</p>

```   
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
export KUBE_CONFIG_PATH=~/.kube/config
```

<p>Setup minikube to use local Docker images</p>
  Set the environment variables with eval $(minikube docker-env)
  Build the image with the Docker daemon of Minikube (eg docker build -t my-image .)
  Set the image in the pod spec like the build tag (eg my-image)
  Set the imagePullPolicy to Never, otherwise Kubernetes will try to download the image.

  When terraform timeout with flask app deployment. Workaround for this use case is to add wait = false to the "helm_release"

  Run terraform in the project root with terraform apply. It will create the app deployment and add a master redis node and 2 replicas.

<h2>How to add git commit tot the container</h2>
 
 ``` 
  export GIT_SHA=$(git rev-parse --short HEAD)
  docker build --build-arg "GIT_SHA=${GIT_SHA}" --tag kubeflask .
```

![image](https://user-images.githubusercontent.com/43659121/196551425-79788159-dbd5-4a01-9909-c246912d842d.png)
![image](https://user-images.githubusercontent.com/43659121/196551504-1a2ad5c5-8f21-47cd-b202-4d5ba12e9c5c.png)
![image](https://user-images.githubusercontent.com/43659121/196551587-5ec76232-cfb3-427b-9484-0a3d93d35c2b.png)
![image](https://user-images.githubusercontent.com/43659121/196551632-d482eb75-a8e3-4478-bafa-d28914a92c47.png)
![image](https://user-images.githubusercontent.com/43659121/196551680-0d22550d-aca8-408f-8ab2-bf0c775e1a63.png)


<p>Monitoring</p>
Run terraform apply in ./monitoring it will create a new namspace called monitoring

How to expose the grafana dashboard to the localhost:

```
  kubectl port-forward --namespace monitoring svc/kube-prometheus-stackr-grafana 3001:80
```

![image](https://user-images.githubusercontent.com/43659121/196549799-a6f7567b-b095-41c8-8dfc-3d2964025e3b.png)
