# AWS Linux Lab & Automated Monitoring

Projekt za vježbu Linux administracije, mrežnih postavki i automatizacije.

## Opis infrastrukture
- **OS:** Ubuntu Server u VirtualBoxu (NAT networking)
- **Firewall:** UFW s otvorenim portovima 22 (SSH) i 80 (HTTP)
- **Web Server:** Nginx web poslužitelj
- **Automatski monitoring:** Bash skripta povezana s `cron` alatkom (pokretanje svakih 5 minuta)

## Skripte
- `system_health.sh` — Prati zauzeće RAM memorije, diska i status Nginx servisa te zapise sprema u `health.log`.

## Pokretanje skripte
```bash
chmod +x system_health.sh
./system_health.sh
