# Master Only
kubeadm init
export KUBECONFIG=/etc/kubernetes/admin.conf
sysctl net.bridge.bridge-nf-call-iptables=1
kubectl apply -f https://raw.githubusercontent.com/romana/romana/master/docs/kubernetes/romana-kubeadm.yml

# deploy aluxio
git clone --depth=1 https://github.com/Alluxio/alluxio.git
cd alluxio/integration/kubernetes/
mv alluxio-journal-volume.yaml.template alluxio-journal-volume.yaml
kubectl create -f alluxio-journal-volume.yaml
kubectl get pv alluxio-journal-volume
mv alluxio-master.yaml.template alluxio-master.yaml
mv alluxio-worker.yaml.template alluxio-worker.yaml
mv conf/alluxio.properties.template conf/alluxio.properties
kubectl create configmap alluxio-config --from-file=ALLUXIO_CONFIG=conf/alluxio.properties
kubectl create -f alluxio-master.yaml
kubectl create -f alluxio-worker.yaml

