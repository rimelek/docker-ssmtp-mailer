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

or store the message  in a variable:

```bash
docker run -i \
  -e SMTP_HOST=smtp.example.tld:587 \
  -e SMTP_USER=SMTPUSER \
  -e SMTP_PASS=SMTPPASSWORD \
  -e TO="recieveraddress@example.tld" \
  -e FROM_EMAIL="senderaddress@example.tld" \
  -e FROM_NAME="Your Name" \
  -e SUBJECT="Subject" \
  -e MESSAGE="This is the message" \
  --rm itsziget/ssmtp-mailer
```

There are some security options turned on by default:

- TLS=YES
- STARTTLS=YES

You can turn them off when you need:

```bash
docker run -i \
  ...
  -e TLS=NO \
  -e STARTTLS=NO \
  ...
```
