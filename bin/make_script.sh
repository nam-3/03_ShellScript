#!/bin/bash
#
#	# make_script.sh <filename>
#
cd /root/bin

cat << 'EOF' > $1
#!/bin/bash



EOF
chmod +x /root/bin/*.sh

