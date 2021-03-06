cmd_create_help() {
    cat <<_EOF
    create
        Create the container '$CONTAINER'.

_EOF
}

rename_function cmd_create orig_cmd_create
cmd_create() {
    local code_dir=$(dirname $(realpath $APP_DIR))
    mkdir -p var-www drush-cache
    orig_cmd_create \
        --mount type=bind,src=$code_dir,dst=/usr/local/src/myproject \
        --mount type=bind,src=$(pwd)/var-www,dst=/var/www \
        --mount type=bind,src=$(pwd)/drush-cache,dst=/root/.drush/cache \
        --workdir /var/www \
        --env CODE_DIR=/usr/local/src/myproject \
        --env DRUPAL_DIR=/var/www/proj \
        "$@"    # accept additional options, e.g.: -p 2201:22

    rm -f myproject
    ln -s var-www/proj/profiles/myproject .

    # create the database
    ds mariadb create
}
