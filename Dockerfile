#
# Node.js Dockerfile
#
# https://github.com/dockerfile/nodejs
#

# Pull base image.
FROM dockerfile/python

# Install Node.js
RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/v0.10.24/node-v0.10.24.tar.gz && \
  tar xvzf node-v0.10.24.tar.gz && \
  rm -f node-v0.10.24.tar.gz && \
  cd node-v* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd /tmp && \
  rm -rf /tmp/node-v* && \
  echo '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bash_profile

# Define mountable directories.
VOLUME ["/data/docker"]

# Define working directory.
WORKDIR /data/docker

# Define default command.
CMD ["bash"]
