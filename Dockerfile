FROM ruby:2.4.0

# Go
RUN curl -sSL https://storage.googleapis.com/golang/go1.7.5.linux-amd64.tar.gz | tar Cxz /usr/local
ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV PATH $GOPATH:$PATH

# Gems
RUN gem install os --no-ri --no-rdoc
