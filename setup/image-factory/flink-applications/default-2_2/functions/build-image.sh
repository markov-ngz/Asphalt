# Function to create with the 3 args from above 

build_maven_docker_image() {
    local app_path=$1
    local jar_name=$2
    local image_name=$3

    echo "--- Phase 1: Packaging Application ---"
    # Use -f to point to the specific pom.xml in the app directory
    mvn clean package -f "$app_path/pom.xml" -DskipTests

    if [ $? -ne 0 ]; then
        echo "Maven build failed!"
        return 1
    fi

    local jar_local_path="$app_path/target/$jar_name"

    cp $jar_local_path .

    echo "--- Phase 2: Building Docker Image ---"
    # We pass the JAR path as a build argument
    docker build \
        --build-arg JAR_LOCAL_PATH="$jar_name" \
        -t "$image_name" .

    rm $jar_name
}