FROM golang:1.11 AS build-env
ADD . /src
RUN cd /src && GOOS=linux GOARCH=386 go build -o goapp

FROM alpine
ENV PORT=$PORT
WORKDIR /app
COPY --from=build-env /src/goapp /app/
CMD /app/goapp
