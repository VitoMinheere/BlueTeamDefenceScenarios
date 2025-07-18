FROM docker:cli

# Install bash and curl for scripting
RUN apk add --no-cache bash curl

COPY attack.sh /attack.sh
RUN chmod +x /attack.sh

ENTRYPOINT ["/attack.sh"] 