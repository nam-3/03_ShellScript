#!/bin/bash

cat > position.txt << 'EOF'
--------------------------------
                    229 228 227
226 225 224 223     222 221 220
219 218 217 216     215 214 213
212 211 210 209     208 207 206
    205 204 203     202 201 200
--------------------------------
            강사(230)
EOF

START=200
END=230
NET=172.16.6
for i in $(seq $START $END)
do
    #echo "$NET.$i"
    ping -c 1 -W 0.5 $NET.$i > /dev/null 2>&1 
    if [ $? -eq 0 ] ; then
        #echo "[  OK  ] $NET.$i" && \
        sed -i "s/$i/ooo/" position.txt
    else
        #echo "[ FAIL ] $NET.$i" && \
        sed -i "s/$i/xxx/" position.txt
    fi
done

cat position.txt


