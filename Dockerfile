#
# Based on work done by adnanklink / plex-norelay-hwdecoding

FROM linuxserver/plex

COPY etc/ /etc/

EXPOSE 32400/tcp
EXPOSE 32400/udp
EXPOSE 32469/tcp
EXPOSE 32469/udp
EXPOSE 5353/udp
EXPOSE 1900/udp

