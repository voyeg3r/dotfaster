# Recording your screen cam
https://trac.ffmpeg.org/wiki/Capture/Webcam

## Recording audio from mic and speakers from commandline
+ https://ask.fedoraproject.org/en/question/65662/

Finally I found a way to achieve what I wanted, using the PulseAudio utility "pacmd".
This tutorial help me

    pacmd list-sources|awk '/index:/ {print $0}; /name:/ {print $0}; /device\.description/ {print $0}'

Run above command to get the names of all the recording interfaces. Sample output is given below.

    index: 0
    name: <alsa_output.pci-0000_00_1b.0.analog-stereo.monitor>
        device.description = "Monitor of Built-in Audio Analog Stereo"
  * index: 1
    name: <alsa_input.pci-0000_00_1b.0.analog-stereo>
        device.description = "Built-in Audio Analog Stereo"

To record from my Speakers: use "Monitor of Built-in Audio Analog Stereo"

    ffmpeg -f pulse -i alsa_output.pci-0000_00_1b.0.analog-stereo.monitor -c:a libmp3lame output.mkv

To record from my Mic: use "Built-in Audio Analog Stereo"

    ffmpeg -f pulse -i alsa_input.pci-0000_00_1b.0.analog-stereo -c:a libmp3lame output.mkv

## substituir o audio de um video

    ffmpeg -i audio.mp3 -i video.mp4 -c copy final-video.mp4

List devices

    v4l2-ctl --list-devices

List device capabilities

     ffmpeg -f v4l2 -list_formats all -i /dev/video0

Usage example

    ffmpeg -f v4l2 -framerate 25 -video_size 640x480 -i /dev/video0 output.mkv

## remove audio from video

	ffmpeg -i grade-metalica.webm -an -vcodec copy output.webm

## merging audio and video

    ffmpeg -i audio.wav -i video.mp4 -acodec copy -vcodec copy output.mp4

## Converter ogv para flv

    ffmpeg -i input.ogv -ar 44100 -acodec libmp3lame output.flv

## Convert vob to avi

    sudo apt-get install libavcodec52  libavutil49
    ffmpeg -i myVideo.vob myvideo.avi

## conversao simples

    ffmpeg -i arquivo.wmv arquivo.avi

O parâmetro "-i" indica o arquivo fonte. O formato do arquivo de saída é automaticamente reconhecido pelo ffmpeg, a partir da sua extensão.

    ffmpeg -i input.flv -sameq -r ntsc outputfile.mpeg

## outro modo
fonte: http://www.quartoestudio.com/blog/ubuntu/tutorial-como-gravar-um-screencast-no-linux-usando-o-terminal-e-o-ffmpeg/

    ffmpeg -f x11grab -s 1280x1024 -r 30 -i :0.0 /tmp/screencast.mpg

## extraindo som de arquivos flash

    ffmpeg -i <filename>.flv -vn <filename>.mp3

## extract audio from video

    ffmpeg -i video.avi -f mp3 audio.mp3

## Referencias
* http://pajeonline.blogspot.com/2009/05/como-converter-videos-no-linux.html

## Comandos prontos do dicas-l
* fonte: http://www.dicas-l.com.br/dicas-l/20100312.php
