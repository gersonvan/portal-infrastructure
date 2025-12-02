# SSL Certificates

Place your SSL certificate files in this directory:

- `certificate.crt` - SSL certificate
- `private.key` - Private key
- `ca_bundle.crt` - CA bundle (if required)

## Generating Self-Signed Certificate (for testing)

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout private.key \
  -out certificate.crt \
  -subj "/C=BR/ST=SP/L=SaoPaulo/O=AVP/CN=portal.avp.com.br"
```

## Using Let's Encrypt (recommended for production)

```bash
# Install certbot
sudo apt-get install certbot

# Generate certificate
sudo certbot certonly --standalone -d portal.avp.com.br

# Certificates will be in:
# /etc/letsencrypt/live/portal.avp.com.br/fullchain.pem
# /etc/letsencrypt/live/portal.avp.com.br/privkey.pem
```

## Security

- Keep private keys secure
- Never commit certificates to version control
- Rotate certificates before expiration
- Use strong encryption (TLS 1.2+)
