# removes the folder in case it exists
rm -rf Docker-Benchmark/

# clones the project
git clone https://github.com/angelicampp/Docker-Benchmark.git
cd Docker-Benchmark

languages=("Python" "Javascript" "Ruby" "Go" "Java")
times=()

# for each language creates an image and then run it into a container
for language in "${languages[@]}"; do
  cd $language
  language="${language,,}"
  docker rm -f "${language}-container" >/dev/null 2>&1
  docker rmi -f "${language}-image" >/dev/null 2>&1
  docker build --no-cache -t "${language}-image" .
  docker run --name "${language}-container" -v "$(pwd)":/app "${language}-image"
  times+=("$(cat ./output.txt)")
  cd ..
done

# formats the numbers with 7 decimal points
formatear_milisegundos() {
  printf "%.7f" "$1"
}

echo -e "\n"
echo -e "\e[1;33mScript Terminado\e[0m"
echo "********************************"
echo "* Lenguaje     * Tiempo        *"

for i in {0..4}; do
  echo "********************************"
  printf "* %-12s * %-10s ms *\n" "${languages[$i]}" "$(formatear_milisegundos ${times[$i]})"
done

echo -e "\e[33mNota: dentro de la carpeta Docker-Benchmark/ por cada lenguaje fue generado un output.txt\e[0m\n"
