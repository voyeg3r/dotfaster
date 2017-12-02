# wireshark.md - Last Change: 2017 dez 02 12:52

Wireshark is a free and open source network protocol analyzer that enables
users to interactively browse the data traffic on a computer network.

# Can one use wireshark to find the correct streaming url of a webradio?
+ https://osqa-ask.wireshark.org/answer_link/13464/


    Close all other applications, except the browser
    Close all tabs in the browser, except the one that loads the web radio page
    Capture the whole traffic of your system, while you listen to the radio stream. HINT: You must start the capture before you click on the "Play" button/link. Don't use any capture filter!
    Look at the TCP statstics (Statistics -> Conversation List -> TCP)
    Sort the out for "Bytes" or "Packets"
    The connection with the most Bytes/Packets is most certainly the audio stream
    Click on that connection and then click on "Follow Stream"
    At the beginning of the TCP connection, you should see the URL (if it was streamed via HTTP).

# Using Wireshark-cli
Do not run Wireshark as root, it is insecure. Wireshark has implemented privilege separation.

    sudo gpasswd -a $USER wireshark

## Capturing Network Traffic Using tshark
+ http://www.linuxjournal.com/content/using-tshark-watch-and-inspect-network-traffic

The first command you should run is sudo tshark -D to get a list of the
available network interfaces:

    sudo tshark -D

Once you find out which interface to use, call Tshark with the -i option and
an interface name or number reported by the -D option.

    tshark -i eth1

# Saving and Reading Network Data Using Files

The single-most useful command-line parameter is -w, followed by a filename.
This parameter allows you to save network data to a file in order to process it
later. The following tshark command captures 500 network packets (-c 500) and
saves them into a file called LJ.pcap (-w LJ.pcap):

    tshark -c 500 -w LJ.pcap

    tshark -c 500 -i wlp7s0 -w ~/tmp/traffic.pcap

To analyze the packets from the previously saved traffic.pcap file, use the -r
option, this will read packets from the instead of a network interface. Note
also that you don't need superuser rights to read from files.

    tshark -r /tmp/traffic.pcap

# Filtering TCP packets
If you want to see all the current TCP packets, type tcp into the "Filter" bar or in the CLI, enter:

    sudo -su "$USER"
    tshark -f "tcp"

Capture Packets with Tshark

    tshark -i wlan0 -w capture-output.pcap

Read a Pcap with Tshark

    tshark -r capture-output.pcap

