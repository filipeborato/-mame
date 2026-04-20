FROM texlive/texlive:latest

RUN apt-get update \
    && apt-get install -y --no-install-recommends fontconfig \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work

COPY docker/latex-entrypoint.sh /usr/local/bin/latex-entrypoint
RUN chmod +x /usr/local/bin/latex-entrypoint

ENTRYPOINT ["latex-entrypoint"]
CMD ["latexmk", "-xelatex", "main.tex"]
