# Ubuntu

## Overview
Ubuntu container with GMT timezone, GB locale and additional tools pre-installed.

## Deployment

### Docker
```bash
# run single command
d run -it --rm \
--name adegoodyer-ubuntu-throwaway \
adegoodyer/ubuntu:latest \
curl -L --head google.co.uk

# disposable container
d run -it --rm \
--name adegoodyer-ubuntu-throwaway \
adegoodyer/ubuntu:latest \
/bin/bash

# persistent container
d run -itd \
--name adegoodyer-ubuntu-latest \
adegoodyer/ubuntu:latest

# persistent container (specify network)
d run -itd \
--network host \
--name kubernetes-admin-toolkit-latest \
adegoodyer/kubernetes-admin-toolkit:latest

# connect to persistent container
d exec -it adegoodyer-ubuntu-latest /bin/bash

# stop and remove persistent container
# (d kill won't always remove)
d stop kubernetes-admin-toolkit-latest && \
d rm kubernetes-admin-toolkit-latest
```

## Build Commands

### Documentation
```bash
# generate grype, syft and README.md
./scripts/gen-docs.sh
```

### Git
- make change and push as usual
- image build and push will occur when a tag is added
  - can be any branch
  - much be of format '[0-9][0-9]+.[0-9][0-9]+' (e.g. 22.04) for pipeline to execute
```bash
# add tag
git tag -a 22.04 -m 22.04

# push tag
git push --follow-tags
```

### Docker
```bash
# build and test locally
d build -t ubuntu-test:latest . &&
d run -it --rm --name ubuntu-test ubuntu-test:latest /bin/bash

# build
d build -t adegoodyer/ubuntu:22.04 -t adegoodyer/ubuntu:latest .

# sec scan
grype adegoodyer/ubuntu:latest

# generate SBOM
syft adegoodyer/ubuntu:latest

# push
d logout && d login --username=adegoodyer
d push adegoodyer/ubuntu --all-tags
```

## Security Scan
```bash
NAME               INSTALLED                 FIXED-IN  TYPE  VULNERABILITY     SEVERITY   
coreutils          8.32-4.1ubuntu1                     deb   CVE-2016-2781     Low         
git                1:2.34.1-1ubuntu1.4                 deb   CVE-2018-1000021  Low         
git-man            1:2.34.1-1ubuntu1.4                 deb   CVE-2018-1000021  Low         
gpgv               2.2.27-3ubuntu2.1                   deb   CVE-2022-3219     Low         
libc-bin           2.35-0ubuntu3.1                     deb   CVE-2016-20013    Negligible  
libc6              2.35-0ubuntu3.1                     deb   CVE-2016-20013    Negligible  
libncurses6        6.3-2                               deb   CVE-2022-29458    Negligible  
libncursesw6       6.3-2                               deb   CVE-2022-29458    Negligible  
libpcre3           2:8.39-13ubuntu0.22.04.1            deb   CVE-2017-11164    Negligible  
libperl5.34        5.34.0-3ubuntu1                     deb   CVE-2020-16156    Medium      
libtinfo6          6.3-2                               deb   CVE-2022-29458    Negligible  
locales            2.35-0ubuntu3.1                     deb   CVE-2016-20013    Negligible  
login              1:4.8.1-2ubuntu2                    deb   CVE-2013-4235     Low         
ncurses-base       6.3-2                               deb   CVE-2022-29458    Negligible  
ncurses-bin        6.3-2                               deb   CVE-2022-29458    Negligible  
openssh-client     1:8.9p1-3                           deb   CVE-2020-14145    Low         
openssh-client     1:8.9p1-3                           deb   CVE-2021-41617    Low         
passwd             1:4.8.1-2ubuntu2                    deb   CVE-2013-4235     Low         
patch              2.7.6-7build2                       deb   CVE-2021-45261    Negligible  
patch              2.7.6-7build2                       deb   CVE-2018-6952     Negligible  
perl               5.34.0-3ubuntu1                     deb   CVE-2020-16156    Medium      
perl-base          5.34.0-3ubuntu1                     deb   CVE-2020-16156    Medium      
perl-modules-5.34  5.34.0-3ubuntu1                     deb   CVE-2020-16156    Medium      
wget               1.21.2-2ubuntu1                     deb   CVE-2021-31879    Medium      
zlib1g             1:1.2.11.dfsg-2ubuntu9.1            deb   CVE-2022-37434    Medium      
```

## SBOM
```bash
NAME                 VERSION                                  TYPE 
adduser              3.118ubuntu5                             deb   
apt                  2.4.8                                    deb   
base-files           12ubuntu4.2                              deb   
base-passwd          3.5.52build1                             deb   
bash                 5.1-6ubuntu1                             deb   
bsdutils             1:2.37.2-4ubuntu3                        deb   
ca-certificates      20211016                                 deb   
coreutils            8.32-4.1ubuntu1                          deb   
curl                 7.81.0-1ubuntu1.4                        deb   
dash                 0.5.11+git20210903+057cd650a4ed-3build1  deb   
debconf              1.5.79ubuntu1                            deb   
debianutils          5.5-1ubuntu2                             deb   
diffutils            1:3.8-0ubuntu2                           deb   
dpkg                 1.21.1ubuntu2.1                          deb   
e2fsprogs            1.46.5-2ubuntu1.1                        deb   
findutils            4.8.0-1ubuntu3                           deb   
gcc-12-base          12.1.0-2ubuntu1~22.04                    deb   
git                  1:2.34.1-1ubuntu1.4                      deb   
git-man              1:2.34.1-1ubuntu1.4                      deb   
gpgv                 2.2.27-3ubuntu2.1                        deb   
grep                 3.7-1build1                              deb   
gzip                 1.10-4ubuntu4.1                          deb   
hostname             3.23ubuntu2                              deb   
init-system-helpers  1.62                                     deb   
less                 590-1build1                              deb   
libacl1              2.3.1-1                                  deb   
libapt-pkg6.0        2.4.8                                    deb   
libattr1             1:2.5.1-1build1                          deb   
libaudit-common      1:3.0.7-1build1                          deb   
libaudit1            1:3.0.7-1build1                          deb   
libblkid1            2.37.2-4ubuntu3                          deb   
libbrotli1           1.0.9-2build6                            deb   
libbsd0              0.11.5-1                                 deb   
libbz2-1.0           1.0.8-5build1                            deb   
libc-bin             2.35-0ubuntu3.1                          deb   
libc6                2.35-0ubuntu3.1                          deb   
libcap-ng0           0.7.9-2.2build3                          deb   
libcap2              1:2.44-1build3                           deb   
libcbor0.8           0.8.0-2ubuntu1                           deb   
libcom-err2          1.46.5-2ubuntu1.1                        deb   
libcrypt1            1:4.4.27-1                               deb   
libcurl3-gnutls      7.81.0-1ubuntu1.4                        deb   
libcurl4             7.81.0-1ubuntu1.4                        deb   
libdb5.3             5.3.28+dfsg1-0.8ubuntu3                  deb   
libdebconfclient0    0.261ubuntu1                             deb   
libedit2             3.1-20210910-1build1                     deb   
liberror-perl        0.17029-1                                deb   
libexpat1            2.4.7-1                                  deb   
libext2fs2           1.46.5-2ubuntu1.1                        deb   
libffi8              3.4.2-4                                  deb   
libfido2-1           1.10.0-1                                 deb   
libgcc-s1            12.1.0-2ubuntu1~22.04                    deb   
libgcrypt20          1.9.4-3ubuntu3                           deb   
libgdbm-compat4      1.23-1                                   deb   
libgdbm6             1.23-1                                   deb   
libgmp10             2:6.2.1+dfsg-3ubuntu1                    deb   
libgnutls30          3.7.3-4ubuntu1.1                         deb   
libgpg-error0        1.43-3                                   deb   
libgssapi-krb5-2     1.19.2-2                                 deb   
libhogweed6          3.7.3-1build2                            deb   
libidn2-0            2.3.2-2build1                            deb   
libk5crypto3         1.19.2-2                                 deb   
libkeyutils1         1.6.1-2ubuntu3                           deb   
libkrb5-3            1.19.2-2                                 deb   
libkrb5support0      1.19.2-2                                 deb   
libldap-2.5-0        2.5.13+dfsg-0ubuntu0.22.04.1             deb   
libldap-common       2.5.13+dfsg-0ubuntu0.22.04.1             deb   
liblz4-1             1.9.3-2build2                            deb   
liblzma5             5.2.5-2ubuntu1                           deb   
libmd0               1.0.4-1build1                            deb   
libmount1            2.37.2-4ubuntu3                          deb   
libncurses6          6.3-2                                    deb   
libncursesw6         6.3-2                                    deb   
libnettle8           3.7.3-1build2                            deb   
libnghttp2-14        1.43.0-1build3                           deb   
libnsl2              1.3.0-2build2                            deb   
libp11-kit0          0.24.0-6build1                           deb   
libpam-modules       1.4.0-11ubuntu2                          deb   
libpam-modules-bin   1.4.0-11ubuntu2                          deb   
libpam-runtime       1.4.0-11ubuntu2                          deb   
libpam0g             1.4.0-11ubuntu2                          deb   
libpcre2-8-0         10.39-3ubuntu0.1                         deb   
libpcre3             2:8.39-13ubuntu0.22.04.1                 deb   
libperl5.34          5.34.0-3ubuntu1                          deb   
libpopt0             1.18-3build1                             deb   
libprocps8           2:3.3.17-6ubuntu2                        deb   
libpsl5              0.21.0-1.2build2                         deb   
librtmp1             2.4+20151223.gitfa8646d.1-2build4        deb   
libsasl2-2           2.1.27+dfsg2-3ubuntu1                    deb   
libsasl2-modules     2.1.27+dfsg2-3ubuntu1                    deb   
libsasl2-modules-db  2.1.27+dfsg2-3ubuntu1                    deb   
libseccomp2          2.5.3-2ubuntu2                           deb   
libselinux1          3.3-1build2                              deb   
libsemanage-common   3.3-1build2                              deb   
libsemanage2         3.3-1build2                              deb   
libsepol2            3.3-1build1                              deb   
libsmartcols1        2.37.2-4ubuntu3                          deb   
libss2               1.46.5-2ubuntu1.1                        deb   
libssh-4             0.9.6-2build1                            deb   
libssl3              3.0.2-0ubuntu1.6                         deb   
libstdc++6           12.1.0-2ubuntu1~22.04                    deb   
libsystemd0          249.11-0ubuntu3.6                        deb   
libtasn1-6           4.18.0-4build1                           deb   
libtinfo6            6.3-2                                    deb   
libtirpc-common      1.3.2-2ubuntu0.1                         deb   
libtirpc3            1.3.2-2ubuntu0.1                         deb   
libudev1             249.11-0ubuntu3.6                        deb   
libunistring2        1.0-1                                    deb   
libuuid1             2.37.2-4ubuntu3                          deb   
libx11-6             2:1.7.5-1                                deb   
libx11-data          2:1.7.5-1                                deb   
libxau6              1:1.0.9-1build5                          deb   
libxcb1              1.14-3ubuntu3                            deb   
libxdmcp6            1:1.1.3-0ubuntu5                         deb   
libxext6             2:1.3.4-1build1                          deb   
libxmuu1             2:1.1.3-3                                deb   
libxxhash0           0.8.1-1                                  deb   
libzstd1             1.4.8+dfsg-3build1                       deb   
locales              2.35-0ubuntu3.1                          deb   
login                1:4.8.1-2ubuntu2                         deb   
logsave              1.46.5-2ubuntu1.1                        deb   
lsb-base             11.1.0ubuntu4                            deb   
mawk                 1.3.4.20200120-3                         deb   
mount                2.37.2-4ubuntu3                          deb   
ncurses-base         6.3-2                                    deb   
ncurses-bin          6.3-2                                    deb   
netbase              6.3                                      deb   
openssh-client       1:8.9p1-3                                deb   
openssl              3.0.2-0ubuntu1.6                         deb   
passwd               1:4.8.1-2ubuntu2                         deb   
patch                2.7.6-7build2                            deb   
perl                 5.34.0-3ubuntu1                          deb   
perl-base            5.34.0-3ubuntu1                          deb   
perl-modules-5.34    5.34.0-3ubuntu1                          deb   
procps               2:3.3.17-6ubuntu2                        deb   
publicsuffix         20211207.1025-1                          deb   
rsync                3.2.3-8ubuntu3                           deb   
sed                  4.8-1ubuntu2                             deb   
sensible-utils       0.0.17                                   deb   
sysvinit-utils       3.01-1ubuntu1                            deb   
tar                  1.34+dfsg-1build3                        deb   
ubuntu-keyring       2021.03.26                               deb   
usrmerge             25ubuntu2                                deb   
util-linux           2.37.2-4ubuntu3                          deb   
wget                 1.21.2-2ubuntu1                          deb   
xauth                1:1.1-1build2                            deb   
zlib1g               1:1.2.11.dfsg-2ubuntu9.1                 deb   
```
