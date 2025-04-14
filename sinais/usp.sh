#!/bin/bash

# Verifica se o arquivo sinais.txt existe
if [[ ! -f usp.txt ]]; then
  echo "Arquivo não encontrado!"
  exit 1
fi

# Cria ou sobrescreve o arquivo lista_sinais.txt
> usp_lista_sinais.txt

# Loop para ler cada linha do sinais.txt
while IFS= read -r linha; do
  # Extrai o nome do arquivo sem a extensão
  nome_arquivo=$(basename "$linha" .gif)
  
  # Formata e escreve no arquivo lista_sinais.txt
  echo "{ value: \"sinais/$linha\", label: \"$nome_arquivo\" }," >> usp_lista_sinais.txt
done < usp.txt

echo "Arquivo lista_sinais.txt gerado com sucesso!"

