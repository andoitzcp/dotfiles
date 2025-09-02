st -T 'stfloat' -g 85x6+550+300 vim /tmp/capture.tmp && \
    echo "" >> /home/syncthing/orgroam/Inbox.org && \
    echo -n '* ' >> /home/syncthing/orgroam/Inbox.org && \
    cat /tmp/capture.tmp >> /home/syncthing/orgroam/Inbox.org && \
    rm /tmp/capture.tmp
