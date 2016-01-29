FROM rocker/shiny 

ENV TERM=xterm-256color

COPY dependencies.R dependencies.R
RUN Rscript dependencies.R

WORKDIR /source

