ziptree () {
    if [ -z "$1" -o "$1" = "-h" -o "$1" = "--help" ]; then
        echo "usage: $0 archive[.zip]";
        return;
    fi
    zipinfo -1 $1 | tree --fromfile .
}
