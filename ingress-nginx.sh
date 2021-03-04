#
#  https://kind.sigs.k8s.io/docs/user/ingress/ 
# 

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml

kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s

kubectl apply -f https://kind.sigs.k8s.io/examples/ingress/usage.yaml

# should output "foo"
curl localhost/foo
# should output "bar"
curl localhost/bar
