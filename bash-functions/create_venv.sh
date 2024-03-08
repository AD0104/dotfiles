function activate_venv(){
    current_path = $(pwd)
    echo "Current Path: $current_path"
    python -m venv venv
    source ./venv/bin/activate
}
