## kubernetes config 
```
kubectl config get-contexts                          # display list of contexts
kubectl config current-context                       # display the current-contextinfo
kubectl cluster-info dump                            # degugging purpose
kubectl config view -o jsonpath='{.users[].name}'    # display the first user
kubectl config view -o jsonpath='{.users[*].name}'   # get a list of users
kubectl config get-contexts                          # display list of contexts
kubectl config current-context                       # display the current-context
kubectl config use-context my-cluster-name           # set the default context to my-cluster-name

kubectl config set-cluster my-cluster-name           # set a cluster entry in the kubeconfig
```

## Creating objects
```
kubectl apply -f ./my-manifest.yaml            # create resource(s)
kubectl apply -f ./my1.yaml -f ./my2.yaml      # create from multiple files
kubectl apply -f ./dir                         # create resource(s) in all manifest files in dir
kubectl apply -f https://git.io/vPieo          # create resource(s) from url
kubectl create deployment nginx --image=nginx  # start a single instance of nginx
kubectl explain pods                           # get the documentation for pod manifests
kubectl describe pods -o wide                  # describe pod
```
## restart policy 
* Always—the pod must always be running, so Kubernetes creates a new container whenever an existing one terminates.
* OnFailure—the container only restarts if it exits with a return code other than 0. Containers that return 0 (successful) do not require restarting.
* Never—the container does not restart.

## Kubernetes Pod Restart Policy
* Every Kubernetes pod follows a defined lifecycle. It starts in the “pending” phase and moves to “running” if one or more of the primary containers     started successfully. Next, it goes to the “succeeded” or “failed” phase based on the success or failure of the containers in the pod.

## pod phase

* pending
* failure
* success
* running
* unknow
* crashloopback trobleshoot [Refer Here](https://komodor.com/learn/how-to-fix-crashloopbackoff-kubernetes-error/#:~:text=What%20is%20Kubernetes%20CrashLoopBackOff%3F,some%20reason%2C%20then%20repeatedly%20crashes.)  

## replicas scale commads (imperative cmd)
```
kubectl scale rs <rs-name> --replicas=5
```
* taint&tolerence [Referhere](https://blog.kubecost.com/blog/kubernetes-taints/)
```
kubectl taint nodes <node-name> poc=true:NoSchedule

#aws
kubectl taint nodes ip-10-0-1-119.us-east-2.compute.internal poc=true:NoSchedule
for other nodes
kubectl taint nodes ip-10-0-1-199.us-east-2.compute.internal poc=false:NoSchedule

kubectl taint nodes ip-10-0-3-230.us-east-2.compute.internal poc=false:NoSchedule
```
## Annatations eks (internal load balancer for tools to understand)
  * [Refer Here](https://docs.aws.amazon.com/eks/latest/userguide/network-load-balancing.html)