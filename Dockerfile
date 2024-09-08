# Use the official OCaml base image
FROM ocaml/opam:ubuntu-22.04

# Switch to root to install dependencies
USER root

# Update package list and install required dependencies
RUN apt-get update && apt-get install -y \
    m4 \
    git \
    curl \
    sudo \
    build-essential \
    libffi-dev \
    libgmp-dev

# Set up OPAM (already installed on the ocaml/opam image)
RUN opam init -y --disable-sandboxing \
    && opam update \
    && opam switch create 4.14.0

# Set the working directory
WORKDIR /home/opam/opam_project

# Install OCaml packages
RUN opam install -y dune utop

# Switch to opam user
USER opam

# Sync local files with Docker container
COPY . .
