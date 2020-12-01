function check_and_install()
{
    FONT=$1
    PACKAGE=$2

    if [ $(fc-list | grep "$FONT" | wc -l) == 0 ]; then
        echo "Installing $FONT using package $PACKAGE..."
        sudo pacman -S $PACKAGE
    fi
}

check_and_install "DejaVu" ttf-dejavu
check_and_install "JetBrains Mono" ttf-jetbrains-mono
check_and_install "Roboto" ttf-roboto
