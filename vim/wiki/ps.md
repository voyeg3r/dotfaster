# ps.md - Last Change: 2017 nov 27 15:18

# Search for a precess by its name

    ps -fC firefox

# Most memory consumption precesses

    ps -A --sort -rss -o comm,pmem,rss | head -n 6

# listar usuario memória e cpu

    ps aux --sort=%mem,%cpu




