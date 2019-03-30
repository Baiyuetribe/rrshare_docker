FROM alpine
USER root
COPY ./rrshare /opt/rrshare

VOLUME ["/opt/work/store"]
CMD ["/opt/rrshare/rrshareweb"]

EXPOSE 3001
EXPOSE 6714
EXPOSE 30210
