# Crontab

## Usage

- Mount the scheduler file of crontab on `/data/crontab`
- Mount the output file of crontab on `/data/output` if needed.
- Start the container without extra cmd.

    > e.g. `docker run -v$PWD/crontab:/data/crontab -v$PWD/output:/data/output fenying/crontab:alpine`

## Tags

- alpine
- nginx-alpine
