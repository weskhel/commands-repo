#basic commands
kubectl explain PARAM #Manuals

kubectl apply -f xxx.yaml
kubectl get pod -o wide
kubectl get pod -A  #list all nodes
kubectl get pod -A -o wide #list with nodes and IP
kubectl get nodes
kubectl describe nodes NODENAME
kubectl config use-context CONTEXT-NAME
kubectl config get-contexts
kubectl config current-context
kubectl -n NAMESPACE all
kubectl run NAMEOFTHEPOD --image PODIMAGE 
kubectl delete pods PODNAME
kubectl expose pod NAMEOFTHEPOD --port PORTTOEXPOSE
kubectl get service
kubectl expose pod NAMEOFTHEPOD --type NodePort
kubectl expose pod NAMEOFTHEPOD --type LoadBalancer --name=app --port=80 
kubectl logs -f NAMEOFTHEPOD
kubectl create namespace NAMESPACE
kubectl create deployment DEPLOYMENTNAME --image nginx --replicas 10 -n NAMESPACE --port PORTNUMBER


#change number of replicas of a pod
kubectl -n NAMESPACE scale statefulset PODNAME --replicas=1

#sort pods by their age
kubectl get pod -A --sort-by=.metadata.creationTimestamp

#create a yaml of a single pod
kubectl run PODNAME --image=httpd:2.4.41-alpine --dry-run=client -o yaml >> xxx.yaml

#asign a pod to a specific node
xxx.yaml
--
...
spec:
    containers:
    ...
    nodeName: NAMEOFTHENODE
--


