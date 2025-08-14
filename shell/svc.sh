#!/bin/bash
#   svc start sshd
#   -> systemctl enable --now sshd    (이미 실행된건 restart 안됨)
#   -> systemctl reload-or-restart sshd
#   svc stop sshd
#   -> systemctl disable sshd
#   -> systemctl stop sshd

if [ $# -ne 2 ] ; then
    echo "Usage: $0 <start|stop> <UNIT>"
    exit 1
fi
ACTION=$1
UNIT=$2

# 유닛 점검
systemctl list-unit-files | /bin/grep -q -w "$UNIT"
if [ $? -ne 0 ] ; then
    echo "[  FAIL  ] $UNIT 을 찾을 수 없습니다."
fi

_START() {
    systemctl enable "$UNIT" > /dev/null 2>&1
    systemctl reload-or-restart "$UNIT" > /dev/null 2>&1
    if [ $? -eq 0 ] ; then
        systemctl is-active "$UNIT"
    fi
}

_STOP() {
    systemctl disable "$UNIT" > /dev/null 2>&1
    systemctl stop "$UNIT" > /dev/null 2>&1
    if [ $? -eq 0 ] ; then
        systemctl is-active "$UNIT"
    fi
}

case $ACTION in
    start) _START ;;
    stop) _STOP ;;
    *) echo "Usage: $0 <start|stop> <UNIT>"
        exit 1 ;;
esac

