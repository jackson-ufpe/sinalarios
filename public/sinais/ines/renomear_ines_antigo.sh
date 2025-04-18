#!/bin/bash

# Define a string que será removida dos nomes dos arquivos
remove_str="Sm_Prog001"

# Itera sobre todos os arquivos no diretório atual
for file in *"$remove_str"*; do
  # Verifica se o arquivo existe (evita erros se não houver arquivos correspondentes)
  if [ -e "$file" ]; then
    # Remove a string "Sm_Prog001" do nome do arquivo
    new_name="${file//$remove_str/}"
    
    # Renomeia o arquivo
    mv "$file" "$new_name"
    
    # Informa o usuário sobre a alteração
    echo "Renomeado: '$file' para '$new_name'"
  fi
done

