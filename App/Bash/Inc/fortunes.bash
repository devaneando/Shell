if [ -x /usr/bin/task ]; then
    /usr/bin/task devaneando
fi

if [ -x /usr/games/fortune ]; then
    echo -e "\e[3m\e[36m$(fortune)\e[0m"
fi
