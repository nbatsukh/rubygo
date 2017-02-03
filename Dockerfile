FROM ruby:2.4.0

# .bashrc is read by .profile, so the variables will be set
# both in login and in interactive shells.
RUN mkdir -p /go && \
echo "export GOPATH=/go" >> ${HOME}/.bashrc && \
echo "export GOROOT=/usr/lib/go-1.7"  >> ${HOME}/.bashrc && \
echo "export PATH=\${GOPATH}/bin:\${GOROOT}/bin:\${PATH}"  >> ${HOME}/.bashrc && \
echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list

RUN apt-get update && apt-get -y install openssh-server openssh-client golang-1.7

# Gems
RUN gem install os --no-ri --no-rdoc

# So that the container doesn't exit automatically
ENTRYPOINT service ssh start && tail -f /dev/null
