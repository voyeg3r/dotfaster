# parallel.md - qui 11 jan 2018 08:01:22 -03
+ https://www.msi.umn.edu/support/faq/how-can-i-use-gnu-parallel-run-lot-commands-parallel

build and execute shell command lines from standard input in parallel

# parallel tutorial

    man parallel_tutorial


    seq 4500 | parallel -j20 wget -c https://speechling.com/static/audio/female/english/english_{}.mp3


