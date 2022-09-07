FROM golang:alpine
COPY ./ /app/
WORKDIR /app/
RUN cd /app/ && rm controllers && go build *.go

FROM alpine
COPY --from=0 /app/controllers .
COPY ./startup.sh /
COPY ./views /views
RUN chmod 755 /startup.sh
CMD [ "/startup.sh" ]