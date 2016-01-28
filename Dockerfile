FROM rocker/shiny 

ENV TERM=xterm-256color
RUN R \
  install.packages('rjson')

WORKDIR /source
