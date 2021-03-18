#!/bin/bash

# Para minera com a ferramenra é simples basta que você tenha apenas o link do repositório que deseja minerar
# Não existe limite para a mineração e nada do codigo posterior aos vetores precisa ser alterado caso dejese adicionar, remover ou trocar os repositórios.

# EX: https://api.github.com/repos/octocat/hello-world/pulls  você usará apenas : octocat/hello-world

# Vetor com nome dos repositórios
vetor=("TheAlgorithms/Java" "Snailclimb/JavaGuide" "CyC2018/CS-Notes" "Snailclimb/JavaGuide" "git/git" "jarun/nnn" "jonas/tig" "hashcat/hashcat" "geekcomputers/Python" "TheAlgorithms/Python" "exercism/python" "AtsushiSakai/PythonRobotics" "ruby/ruby" "rails/rails" "exercism/ruby" "rubocop/ruby-style-guide" "vuejs/vue" "trekhleb/javascript-algorithms" "ryanmcdermott/clean-code-javascript" "da2k/curso-javascript-ninja")

# Vetor para nome do repositório minerados
vetor_name=("java_TheAlgorithms_Java" "java_Snailclimb_JavaGuide" "java_CyC2018_CS-Notes" "java_Snailclimb_JavaGuide" "c_git_git" "c_jarun_nnn" "c_jonas_tig" "c_hashcat_hashcat" "python_geekcomputers_Python" "python_TheAlgorithms_Python" "python_exercism_python" "python_AtsushiSakai_PythonRobotics" "ruby_ruby_ruby" "ruby_rails_rails" "ruby_exercism_ruby" "ruby_rubocop_ruby-style-guide" "javascript_vuejs_vue" "javascript_trekhleb_javascript-algorithms" "javascript_ryanmcdermott_clean-code-javascript" "javascript_da2k_curso-javascript-ninja")

# obtendo a quantidade de repositórios a serem minerados
tam_vetor=${#vetor[@]}

echo "Você está minerando $tam_vetor repositórios."

mkdir planilhas 
cd planilhas


for ((i=0; i<${tam_vetor}; i++))
do
        curl -l   https://api.github.com/repos/"${vetor[$i]}"/pulls?state=closed | grep 'login' | sed 's/"login"://g' | sed 's/[", ]//g' | sort | uniq -c |sort -nr | awk '{print $2 ";"$1}' >  "${vetor_name[$i]}".csv
done

read -p "Press any key to resume ..."
