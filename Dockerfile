
FROM ruby:2-slim

RUN brew install hugo

COPY entrypoint.sh /
RUN chmod 777 entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
