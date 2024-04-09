#!/bin/bash

echo "Digite o caminho para o diretório:"
read -r path

# Verificando se o diretório existe
if [ -d "$path" ]; then
    cd "$path"
   
    echo "arquivos modificados:" 
    output_file="arquivos_modificados.tar.gz"
    find . -type f -mtime -1 -exec tar -rvf "$output_file" {} +
        echo "Os arquivos modificados foram salvos em $output_file"
else
    echo "Diretório inválido"
fi


# Parametros usados no find:
# -type f: considera apenas arquivos regulares(nao diretorios)
# -mtime -1: considera apenas arquivos modificados em -1 dia (nas ultimas 24 horas
# -exec tar -rvf {} +: o -r adiciona os arquivos encontrados ao tar existente
# -f sem o -f o tar exibe um erro indicando que e esperado um nome de arquivo
# -v para ver a lista dos arquivos adicionados conforme tar os processa.
# o {} e um espaco reservado para nome do arquivo que o find encontra
# o + executa o tar para todos arquivos encontrados de uma so vez 
# inves de ter que chamar ele para cada arquivo individualmente.
