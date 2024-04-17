# Usando a imagem oficial do NGINX como base
FROM nginx:latest AS rm551569-nginx

# ExecutANDO comandos para atualizar o Ubuntu e instalar ferramentas curl e vim
RUN apt-get update && apt-get install -y \
    curl \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Criando uma pasta na raiz do container chamada MEU-SITE
RUN mkdir -p /MEU-SITE

# Copiando o arquivo index.html para a pasta MEU-SITE
COPY ./MEU-SITE/index.html /MEU-SITE

# Copiando os arquivos da página web estática para o diretório padrão do NGINX
COPY ./MEU-SITE /usr/share/nginx/html

# Metadados
LABEL description="Imagem para hospedar uma página web estática em um contêiner Docker" \
    author="Marina Cucco" \
    version="1.0" \
    email="marinascucco@outlook.com"

# Expondo a porta padrão HTTP 8080
EXPOSE 80

# Criando um usuário Linux na imagem com RM
RUN useradd -m -s /bin/bash rm551569