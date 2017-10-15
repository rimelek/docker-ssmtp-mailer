#!/bin/sh

#!/bin/sh

: ${TO:?Variable TO is required!}
: ${FROM_EMAIL:?Variable FROM_EMAIL is required!}
: ${SMTP_USER:?Variable SMTP_USER is required!}
: ${SMTP_PASS:?Variable SMTP_PASS is required!}
: ${SMTP_HOST:?Variable SMTP_HOST is required!}

: ${MESSAGE:?Variable Message is required!}

if [ "${TLS}" == "" ]; then TLS=YES; fi;
if [ "${STARTTLS}" == "" ]; then STARTTLS=YES; fi;
if [ "${SUBJECT}" == "" ]; then SUBJECT="No Subject"; fi;
if [ "${FROM_NAME}" == "" ]; then FROM_NAME="${FROM_EMAIL}"; fi;

cat > /etc/ssmtp/ssmtp.conf << EOF
mailhub=${SMTP_HOST}
UseTLS=${TLS}
UseSTARTTLS=${STARTTLS}
AuthUser=${SMTP_USER}
AuthPass=${SMTP_PASS}
EOF

usermod -c "${FROM_NAME}" root

cat > /etc/ssmtp/revaliases << EOF
root:${FROM_EMAIL}:${SMTP_HOST}
EOF

ENCODED_SUBJECT=$(echo "${SUBJECT}" | base64)

cat > /tmp/ssmtp.txt << EOF
Subject: =?utf-8?B?${ENCODED_SUBJECT}?=

EOF

while read input; do
  echo $input >> /tmp/ssmtp.txt
done

cat /tmp/ssmtp.txt | ssmtp "${TO}"