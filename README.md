# curl2r



## Installation

```r
devtools::install_github('badbye/curl2r')
```

## Usage

- Move script to environment

```bash
cp `Rscript -e "cat(system.file('bin/curl2r', package = 'curl2r'))"` /usr/local/bin
```

Let's go!

```bash
curl2r curl 'https://www.baidu.com/' -H 'Pragma: no-cache' -H 'DNT: 1' -H 'Accept-Encoding: gzip, deflate, sdch, br' -H 'Accept-Language: zh-CN,zh;q=0.8,en;q=0.6,de;q=0.4' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: no-cache' -H 'Cookie: BAIDUID=00D3E14431D28C9DCBA3550ACF3380B6:FG=1; BIDUPSID=00D3E12121D41B9DCBA3850BCF3380B6; PSTM=1487356509; BD_HOME=0; H_PS_PSSID=22085_1445_21112_19560_17001_22098; BD_UPN=127653; __bsi=17301350281280863238_11_0_I_R_5_0733_C02F_N_I_I_0' -H 'Connection: keep-alive' --compressed
```
