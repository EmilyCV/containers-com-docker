# FROM - estamos escolhendo a imagem base para criar o container.
FROM ubuntu

# MAINTAINER - especifica o nome de quem vai manter a imagem.
# MAINTAINER Daniel Romero <infoslack@gmail.com> (obsoleto)

# RUN - permite a execução de um comando no container.
RUN apt-get update
RUN apt-get install -y nginx

# ADD - o arquivo chamado exemplo será copiado para o 
# diretório /etc/nginx/sites‐enabled, e será chamado de default.
ADD exemplo /etc/nginx/sites-enabled/default

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Copia os arquivos a partir do contexto no qual foi 
# executado para o filesystem do container.
ADD ./ /rails

# WORKDIR - A área de trabalho padrão do Docker é o diretório raiz /. Podemos alterar 
# isso durante a criação de um container
WORKDIR /rails

# EXPOSE - informa ao Docker que o contêiner obedece as portas de 
# rede especificadas em tempo de execução.
EXPOSE 8080

# ENTRYPOINT - chama o comando ou script diretamente.
# Quando utilizamos ENTRYPOINT, tudo o que for especificado em CMD será enviado como 
# complemento para ENTRYPOINT.
ENTRYPOINT ["/usr/sbin/nginx"]

# CMD - ele inicia o Nginx sempre que um container novo for criado.
# CMD service nginx start
CMD ["nginx", "-g", "daemon off;"]