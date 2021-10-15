Minikube Test Runner
===

Follow the steps:

1. Run minikube : `minikube start`
2. Cache the image to they can be found by minikupe 
3. Install the related helm charts nfs: `./setup-nfs.sh`
4. Setup the databasse:   `./setup-db.sh`
5. Launch the Moodle fpm / apache
6. 

Accessing the site
===

Following https://minikube.sigs.k8s.io/docs/handbook/accessing/
1. Start minikube tunnel `minikube tunnel`
2. Get the IP of the service: `kubectl get svc`
3. Add 'moodle-minikube.local' to your /etc/hosts

# Certificate

    Avec acme.sh : git clone https://github.com/acmesh-official/acme.sh.git

    acme.sh --issue --dns -d *.minikube.call-learning.io --yes-I-know-dns-manual-mode-enough-go-ahead-please
    acme.sh --renew --dns -d *.minikube.call-learning.io --yes-I-know-dns-manual-mode-enough-go-ahead-please
