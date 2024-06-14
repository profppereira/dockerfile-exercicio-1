# Instruções do Desenvolvedor do Aplicativo

# Você deve usar a imagem oficial do `node`, com a versão alpine 6.x (`node:6-alpine`).
# (Sim, esta é uma imagem de node de 2 anos atrás, mas todas as imagens oficiais estão sempre disponíveis no Docker Hub para garantir que até mesmo aplicativos antigos ainda funcionem. É comum ainda precisar implantar versões antigas de aplicativos, mesmo anos depois.)
# Este aplicativo escuta na porta 3000, mas o contêiner deve escutar na porta 80 do host Docker, para que ele responda a [http://localhost:80](http://localhost:80) no seu computador.
# Então, ele deve usar o gerenciador de pacotes alpine para instalar tini: `apk add --no-cache tini`.
# Depois, deve criar o diretório /usr/src/app para os arquivos do aplicativo com `mkdir -p /usr/src/app`, ou com o comando WORKDIR no Dockerfile `WORKDIR /usr/src/app`.
# O Node.js usa um "gerenciador de pacotes", então é necessário copiar o arquivo package.json.
# Depois, é necessário executar 'npm install' para instalar as dependências desse arquivo.
# Para mantê-lo limpo e pequeno, execute `npm cache clean --force` após o acima, no mesmo comando RUN.
# Depois, deve copiar todos os arquivos do diretório atual para a imagem.
# Então, deve iniciar o contêiner com o comando `/sbin/tini -- node ./bin/www`. Certifique-se de usar a sintaxe de matriz JSON para CMD. (`CMD [ "algo", "algo" ]`)
# Seu Dockerfile final, você deve conter os comandos FROM, RUN, WORKDIR, COPY, EXPOSE e CMD.

