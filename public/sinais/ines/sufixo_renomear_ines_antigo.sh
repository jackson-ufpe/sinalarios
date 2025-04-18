#!/bin/bash

# Solicita o sufixo ao usuário
read -p "Digite o sufixo que deseja adicionar aos arquivos: " sufixo

# Verifica se o sufixo está vazio
if [[ -z "$sufixo" ]]; then
  echo "Você não digitou um sufixo. Encerrando o script."
  exit 1
fi

# Percorre todos os arquivos da pasta atual (ignora diretórios)
for arquivo in *; do
  if [[ -f "$arquivo" ]]; then
    # Obtém nome base e extensão
    nome_base="${arquivo%.*}"
    extensao="${arquivo##*.}"

    # Caso o arquivo não tenha extensão
    if [[ "$arquivo" == "$nome_base" ]]; then
      novo_nome="${nome_base}_${sufixo}"
    else
      novo_nome="${nome_base}_${sufixo}.${extensao}"
    fi

    # Renomeia o arquivo
    mv "$arquivo" "$novo_nome"
    echo "Renomeado: $arquivo -> $novo_nome"
  fi
done

