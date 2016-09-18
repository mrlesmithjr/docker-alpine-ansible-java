FROM mrlesmithjr/alpine-ansible

MAINTAINER Larry Smith Jr. <mrlesmithjr@gmail.com>

# Define JRE Version
ENV OPENJDK_JRE_VERSION="7"

# Copy Ansible Related Files
COPY config/ansible/ /

# Run Ansible playbook
RUN ansible-playbook -i "localhost," -c local /playbook.yml \
  --extra-vars "openjdk_jre_version=$OPENJDK_JRE_VERSION" && \
  rm -rf /tmp/* && \
  rm -rf /var/cache/apk/*
