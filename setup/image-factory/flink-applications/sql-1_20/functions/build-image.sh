build_sql_image() {
    local app_path=$1
    local jar_name=$2
    local sql_file_path=$3
    local sql_file=$4
    local image_name=$5

    # 1. Check if the JAR exists in the target folder
    # -f checks if the path exists AND is a regular file
    if [ ! -f "$app_path/target/$jar_name" ]; then
        echo "JAR not found. Packaging application..."
        mvn clean package -f "$app_path/pom.xml" -DskipTests
    else
        echo "JAR already exists, skipping Maven build."
    fi

    # 2. Prepare the context
    # Copy both the JAR and the SQL file to the current dir so Docker can see them
    cp "$app_path/target/$jar_name" .
    cp "$sql_file_path/$sql_file" .

    # 3. Build the image
    docker build \
        --build-arg SQL_RUNNER_JAR="$jar_name" \
        --build-arg SQL_FILE="$sql_file" \
        -t "$image_name" .

    # 4. Cleanup local copies
    rm "$jar_name" "$sql_file"
}