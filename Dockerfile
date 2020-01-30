
FROM alpine:3.4

COPY entrypoint.sh /
RUN chmod 777 entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
