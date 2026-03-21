# Loading generated image to minikube 
export IMAGES=$(docker image ls --format "{{.Repository}}:{{.Tag}}" | grep "asphalt")

for img in $IMAGES; do
    echo "--- Checking image: $img ---"

    # 2. Check if image already exists in Minikube
    if minikube image ls | grep -q "$img"; then
        read -p "Image $img already exists in Minikube. Overwrite? (y/N): " confirm
        if [[ $confirm != [yY] ]]; then
            echo "Skipping $img."
            continue
        fi
    fi

    # 3. Load the image
    echo "Loading $img to Minikube (this may take up to 30s) ..."
    minikube image load "$img"
    echo "Done!"
done