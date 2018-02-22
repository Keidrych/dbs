kubeadm join --token c26c73.b91a65abf7075fa8 103.16.128.179:6443 --discovery-token-ca-cert-hash sha256:d12c1fc7ea6cc8ea39ddaa0841382a0be8fb517d635062a91b197f3ccceb8d9f

mkdir /tmp/domain
chmod a+w /tmp/domain
touch /tmp/domain/d
chmod a+w /tmp/domain/d

yum install git -y
docker build -t alluxio/alluxio .

