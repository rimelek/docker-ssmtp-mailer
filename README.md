SSMTP mailer in Docker container

**NOTE:** This is still just a development version. Do not use it in production!

**Usage example:**

```bash
cat message.txt | docker run -i \
  -e SMTP_HOST=smtp.example.tld:587 \
  -e SMTP_USER=SMTPUSER \
  -e SMTP_PASS=SMTPPASSWORD \
  -e TO="recieveraddress@example.tld" \
  -e FROM_EMAIL="senderaddress@example.tld" \
  -e FROM_NAME="Your Name" \
  -e SUBJECT="Subject" \
  --rm itsziget/ssmtp-mailer
```
