# Glacier website

This is the source of the website you see at https://glacierprotocol.org.

Glacier is a step-by-step protocol for storing bitcoins in a highly secure
manner. It is intended for:

* Personal storage
* Large amounts of money ($100,000+)
* Long-term storage
* Infrequently-accessed funds
* Technically unskilled users

## Do a local build

To build this site locally, you just need to have [Docker](https://www.docker.com/)
installed, and run:

```
make
```

This builds and serves your local copy at `https://localhost:4000`.

We use [Github Pages](https://pages.github.com/) to generate and serve this
site. Under the hood, Github Pages uses [Jekyll](https://jekyllrb.com) as
a static web site generator.
