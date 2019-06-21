ARG ruby_version=2.5.3
ARG node_version=12
ARG freetds_version=1.00.110

FROM veracross/freetds:${freetds_version} as freetds
FROM node:${node_version} as node
FROM ruby:${ruby_version}

COPY --from=freetds /usr/local /usr/local
COPY --from=node /usr/local /usr/local

# https://github.com/moby/moby/issues/2259
# https://nickjanetakis.com/blog/docker-tip-56-volume-mounting-ssh-keys-into-a-docker-container
COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
ENTRYPOINT ["/bin/entrypoint.sh"]
