# LiPP

LiPP is Private PaaS ❗

- Ruby(2.5.1)
- Ruby on Rails(5.2.1)
- Node.js(10.6.0)
- Vue.js(2.5.16)
- PostgreSQL(10.1)
- Docker(18.05.0-ce)


## Deployment

.env

```bash
GITHUB_KEY=<GITHUB_KEY>
GITHUB_SECRET=<GITHUB_KEY>
LIPP_HOST=<SERVER_HOST>
SECRET_KEY_BASE=<SECRET_KEY_BASE>
```

```bash
$ git clone git@github.com:guni973/LiPP
$ cd LiPP
$ docker-compose up --build
```
