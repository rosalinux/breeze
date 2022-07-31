# !/bin/bash

cd ./rpm/
rm -rf BUILD BUILDROOT RPMS SRPMS breeze-*.tar.* *.buildlog
cd ./../
rsync -av --exclude='.git' --exclude='rpm' ./ ./breeze-5.23.5
tar  -czf ./rpm/breeze-5.23.5.tar.gz breeze-5.23.5
rm -rf ./breeze-5.23.5
cd ./rpm/
dnf builddep breeze.spec
abb build --nodeps --target=aarch64-openmandriva-linux
cd ./../

