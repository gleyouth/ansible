cfssl gencert -initca ca-csr.json | cfssljson -bare ca -
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=www server-csr.json | cfssljson -bare server

# Copy to roles under the certificate
pwd_dir=$(pwd |sed 's#ssl/etcd##')
etcd_cert_dir=$pwd_dir/roles/etcd/files/etcd_cert
apiserver_cert_dir=$pwd_dir/roles/master/files/etcd_cert
mkdir -p $etcd_cert_dir $apiserver_cert_dir
for dir in $etcd_cert_dir $apiserver_cert_dir; do
  cp -rf ca.pem server.pem server-key.pem $dir
done 
