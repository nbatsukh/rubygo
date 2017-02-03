FROM ruby:2.4.0

# Go
RUN curl -sSL https://storage.googleapis.com/golang/go1.7.5.linux-amd64.tar.gz | tar Cxz /usr/local

# Gems
RUN gem install os --no-ri --no-rdoc

# .bashrc is read by .profile, so the variables will be set 
# both in login and in interactive shells.
RUN echo "export GOPATH=/go" >> ${HOME}/.bashrc && \
    echo "export GOROOT=/usr/local/go"  >> ${HOME}/.bashrc && \
    echo "export PATH=\${GOPATH}:\${PATH}"  >> ${HOME}/.bashrc
RUN apt-get update && apt-get -y install openssh-server openssh-client 

# So that the container doesn't exit automatically
CMD ["tail", "-f", "/dev/null"]
