FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i 's|http://archive.ubuntu.com/ubuntu|http://mirror.yandex.ru/ubuntu|g' /etc/apt/sources.list && \
    apt-get update && apt-get install -y --no-install-recommends \
        texlive-xetex \
        texlive-fonts-recommended \
        texlive-latex-extra \
        texlive-latex-recommended \
        texlive-lang-cyrillic \
        texlive-fonts-extra \
        texlive-pictures \
        texlive-science \
        cm-super \
        dvipng \
        fonts-dejavu-core \
        fontconfig \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /cv
COPY . .

RUN fc-cache -fv
#RUN xelatex -interaction=nonstopmode main.tex
#
#CMD ["xelatex", "-interaction=nonstopmode", "main.tex"]
ENTRYPOINT ["./build.sh"]
