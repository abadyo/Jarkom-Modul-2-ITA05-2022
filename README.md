# Jarkom-Modul-2-ITA05-2022

---

| Nama                            |    NRP     |
| ------------------------------- | :--------: |
| Muhammad Hanif Fatihurrizqi     | 5027201068 |
| Abadila Barasmara Bias Dewandra | 5027201052 |
| Fadly Rachman Drajad Juliantono | 5027201038 |

# Soal 1
Diminta untuk membuat topologi dengan spesifikasi sebagai berikut :
![](https://lh4.googleusercontent.com/RVXzp5am1pnirpEyvP6H6FhQd5pF4ZrqNLtmJJKkSFg9EuHxIJMTpjiLZBjHarVpFnwuvFIRqY7SUp9uJWyrEzMcSupF5hUPCyvzvV53XmIiN_vXMbo63Gap_3Dbj7foDid4jaqxWlFRvt2RnSDoQbF-v3AD-JV37K7eBTP2Bu_4z73uHRl1-AnmHA)

WISE akan dijadikan sebagai DNS Master, Berlint akan dijadikan DNS Slave, dan Eden akan digunakan sebagai Web Server. Terdapat 2 Client yaitu SSS, dan Garden. Semua node terhubung pada router Ostania, sehingga dapat mengakses internet.

## Solusi 
Kita menyusun topologi sesuai dengan yang digambarkan dan untuk konfigurasi pada setiap node akan di set seperti berikut ini

### 1. Konfigurasi Ostania
``` 
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address 10.42.1.1
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
	address 10.42.2.1
	netmask 255.255.255.0

auto eth3
iface eth3 inet static
	address 10.42.3.1
	netmask 255.255.255.0
```
### 2. Konfigurasi SSS
``` 
auto eth0
iface eth0 inet static
	address 10.24.1.2
	netmask 255.255.255.0
	gateway 10.24.1.1
```
### 3. Konfigurasi Garden
``` 
auto eth0
iface eth0 inet static
	address 10.24.1.3
	netmask 255.255.255.0
	gateway 10.24.1.1
```
### 4. Konfigurasi WISE
``` 
auto eth0
iface eth0 inet static
	address 10.42.3.2
	netmask 255.255.255.0
	gateway 10.42.3.1
```
### 5. Konfigurasi Berlint
``` 
auto eth0
iface eth0 inet static
	address 10.42.2.2
	netmask 255.255.255.0
	gateway 10.42.2.1
```
### 6. Konfigurasi Eden
``` 
auto eth0
iface eth0 inet static
	address 10.42.2.3
	netmask 255.255.255.0
	gateway 10.42.2.1
```
### 7. Test PING
```
ping google.com -c 5
```
# Soal 2
Membuat subdomain wise.ita05.com dengan alias www.wise.ita05.com

## Solusi
### 1. Install bind di WISE
```
apt-get bind9 -y
```
### 2. Edit file `named.conf.local` 
Jalankan `nano /etc/bind/named.conf.local` dan tambahkan :
```
zone "wise.ita05.com" {
        type master;
        file "/etc/bind/jarkom/wise.ita05.com";
};
```
### 3. Edit file `resolv.conf` di *SSS* `/etc/resolv.conf`
```
nameserver 10.42.3.2
nameserver 192.168.122.1
```
### 4. Lakukan Pengetesan Website
``` 
ping wise.ita05.com -c 5
```
![](https://lh3.googleusercontent.com/3fqWBHgl4EQAU3n1ztcxFnzspRnaNS4L1Twf_WDQRS0afBeTTXBWT062r4w6uD3HrArBYAbGUq-ilnBiguEVSVNHmUkeUrrNLCdSem5q3wYAFYbgMgJLyIdTf_QE6ky0mGU3IbnD40rI5CPhlf9V--Is2mLooKpj3H8j5WdkXR6onaW3Nw_lCDtswg)
![](https://lh3.googleusercontent.com/_ae-X53KOkwyFxsEVMMTi5-cCPXILU5HeYNt64KH-uFGswDB8q4oGUXLN5pWlL1tWcOHWaAEKMJF2r2MJL9QLmTkhThKdSskCGIa47bRG27rhLQZdWRbJ5dFEaER3uvff0qsufykRTVsBgnuyZZuunDhun12cbjmc8STio7J26zsdTR2VMFPPuB9mw)

# Soal 3
Kemudian kita membuat subdomain eden.wise.itas05.com dengan alias [www.eden.wise.ita05.com](http://www.eden.wise.ita05.com) dengan mengatur DNS di WISE dan mengarah ke Eden.

## Solusi
### 1. Ubah isi file wise.ita05.com yang ada pada WISE dengan mengakses melalui 
```
nano jarkom/wise.ita05.com
```
Isi seperti berikut :
```
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     wise.ita05.com. root.wise.ita05.com. (
                              2022102501                ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      wise.ita05.com.
@       IN      A       10.42.2.3
www     IN      CNAME   wise.ita05.com.
eden    IN      A       10.42.2.3
www.eden        IN      CNAME   eden.wise.ita05.com.
@		IN	AAAA	::1
```

### 2. Testing subdomain
Jalankan pada SSS
```
ping eden.wise.ita05.com
```
![](https://lh4.googleusercontent.com/8Jb6zTvIEbuU5URSHQDwyDWHdgaYKCFrIndj6doJ6prqdh-viVYCZrzApa4Xq6s5zUX7F-DTQ-3sNZ5h9z68kUIUl-yaCKSlDWeSP1gGufgG-QkMoHnvVn07vLAi1eNMEVX1NqxN3AUzRB5_MnkOkm5SoyTOoLyF6sgSQg7SxEF0RwKrQsDmUWIniw)

```
ping www.eden.wise.ita05.com -c 5
```

![](https://lh5.googleusercontent.com/WSLScNO4XQPgJNGh11XGG1BroczU4BKnz4QplwAQ0He-Cg_9iv94hPPHO5xsSQbWoyvXV-GQL5DAAirDpTHw85OJdy_NTYoaAFro5PGlLs1x-OC2ouDcnvs2RlfCntOBPLPCK1y_DUK477WNjH-ppymtMpNY6R05wyHLKgplWSx5FC9DgabXoLBL2A)

# Soal 4
Diminta untuk membuat reverse domain untuk domain utama

## Solusi 
### 1.  Edit file named.conf.local 
Buka Web Console di WISE dan jalankan 
```
nano /etc/bind/named.conf.local
```
Edit isi file seperti berikut
```
zone "2.42.10.in-addr.arpa" {
    type master;
    file "/etc/bind/wise/2.42.10.in-addr.arpa";
};
```

### 2. Edit file 3.42.10.in-addr.arpa 
Buka Web Console di WISE dan jalankan 
```
nano /etc/bind/wise/ 3.42.10.in-addr.arpa
```
Edit isi file seperti berikut
```
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     wise.ita05.com. root.wise.ita05.com. (
                              2022102502                ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
2.42.10.in-addr.arpa.   IN      NS      wise.ita05.com.
3       IN      PTR     wise.ita05.com.
```

### 3. Reverse DNS dari 10.42.3.2
Buka Web Console di SSS dan jalankan
```
host -t PTR 10.42.3.2
```
Hasilnya

![](https://lh3.googleusercontent.com/qHiTBAFkB9lDi7k_stjpX2oVuOk7q-1ZGE9eASLm5Urd5Cp5VUz3Zv5vk0Kq8Zevqo74B_iKKhDd5x3-fqHGegGeDaO04YtjlEnsDI8A-mz-NemYD2S2cguXI7m7AiJDQZoR2GKelzX66qCE7eG-Letz25QExWlfrjpY0A60qf0NViLM2LdfEJLS7w)


# Soal 5
Membuat Berlint sebagai DNS slave untuk domain utama

## Solusi
### 1. Ubah file named.conf.local di WISE
Buka Web Console di WISE dan jalankan
```
nano /etc/bind/named.conf.local
```
Edit isi file seperti berikut
```
zone "wise.ita05.com" {
        type master;
        also-notify { 10.42.2.2; };
        allow-transfer { 10.42.2.2; };
        file "/etc/bind/wise/wise.ita05.com";
};

zone "2.42.10.in-addr.arpa" {
    type master;
    file "/etc/bind/wise/2.42.10.in-addr.arpa";
};
```

### 2. Ubah file named.conf.local di BERLIN 
Buka Web Console di BERLIN dan jalankan
```
nano /jarkom/named.conf.local
```
Edit isi file seperti berikut
```
zone "wise.ita05.com" {
    type slave;
    masters { 10.42.3.2; }; // Masukan IP EniesLobby tanpa tanda petik
    file "/var/lib/bind/wise.ita05.com";
};
```
### 3. Lakukan restart pada WISE
Jalankan
```
service bind9 stop
```
![](https://lh6.googleusercontent.com/bNGsfLB9VbgY4Sr9x0mj1J0dLHIpEV7RsvAVIAb7ke39LA2UwEXwRLhoPqFcblSP-kZycxRls0URFn6T1UJRC3kiGP7p0DtISYK-ae4dvKhxvoRmHlOzPRCcTsruOKGlEIfBiyc7QT5OEMed-8GxXVuJ1-_juEKDN7Jk67H-9NeZIJ3yqUHosxjDQw)

### 4. Testing
Buka Web Console di SSS dan jalankan
```
ping wise.ita05.com
```
![](https://lh5.googleusercontent.com/MFddb_mXoMbScVhWv_Ij6TTrs-1n9DCKfhiC_li0AzHU4ABxZMKW-fe88-dVFrXSGWRQKQafxroyG145F0oBV847UswkO1OXwl8jZp2jRanwe61F5aQrJc-YK_79B-z1CZ7KhIk6TEkp2ES-dDTyzrro6wug86odkK3TLhkul8Itt43sxH6dEoSWRA)

# Soal 6
Membuat subdomain khusus untuk operation yaitu operation.wise.ita05.com dengan alias [www.operation.wise.ita05.com](http://www.operation.wise.ita05.com) yang didelegasikan dari WISE ke Berlint dengan IP menuju Eden dalam folder operation

## Solusi
### 1. Edit file wise.ita05.com di WISE
Buka Web Console di WISE dan jalankan
```
nano /etc/bind/wise.ita05.com
```
Sesuaikan isi file seperti berikut
```
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     wise.ita05.com. root.wise.ita05.com. (
                              2022102501                ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      wise.ita05.com.
@       IN      A       10.42.2.3
www     IN      CNAME   wise.ita05.com.
eden    IN      A       10.42.2.3
www.eden        IN      CNAME   eden.wise.ita05.com.
ns1     IN      A       10.42.2.2
operation       IN      NS      ns1
www.operation   IN      CNAME   operation.wise.ita05.com.
@       IN      AAAA    ::1
```

### 2. Edit file named.conf.options di WISE
```
nano /etc/bind/named.conf.options
```
Sesuaikan isi file seperti berikut
```
options {
        directory "/var/cache/bind";

        allow-query{any;};

        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};
```
### 3. Edit file named.conf.local di WISE
```
nano /etc/bind/named.conf.local
```
Sesuaikan isi file seperti berikut
```
zone "wise.ita05.com" {
        type master;
        also-notify { 10.42.2.2; };
        allow-transfer { 10.42.2.2; };
        file "/etc/bind/wise/wise.ita05.com";
};

zone "2.42.10.in-addr.arpa" {
    type master;
    file "/etc/bind/wise/2.42.10.in-addr.arpa";
};
```
### 4. Edit file named.conf.local di Berlint
```
nano /jarkom/named.conf.local
```
Sesuaikan isi file seperti berikut
```
zone "wise.ita05.com" {
    type slave;
    masters { 10.42.3.2; }; // Masukan IP EniesLobby tanpa tanda petik
    file "/var/lib/bind/wise.ita05.com";
};

zone "operation.wise.ita05.com" {
        type master;
        file "/etc/bind/operation/operation.wise.ita05.com";
};
```
### 5. Edit file named.conf.options di Berlint
```
nano /jarkom/named.conf.options
```
Sesuaikan isi file seperti berikut
```
options {
        directory "/var/cache/bind";
		allow-query{any;};

        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};
```

### 6. Edit operation.wise.ita05.com di Berlint
```
nano jarkom/operation.wise.ita05.com
```
Sesuaikan isi file seperti berikut
```
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     operation.wise.ita05.com. root.operation.wise.ita05.com$
                              2022102502                ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      operation.wise.ita05.com.
@       IN      A       10.42.2.3
www     IN      CNAME   operation.wise.ita05.com.
```

# Soal 7
Membuat subdomain melalui Berlint dengan akses strix.operation.wise.ita05.com dengan alias [www.strix.operation.wise.ita05.com](http://www.strix.operation.wise.ita05.com) yang mengarah ke Eden

## Solusi

###1. Edit  file operation.wise.ita05.com di Eden
```
nano /etc/bind/operation/file operation.wise.ita05.com
```

![](https://lh6.googleusercontent.com/_uBRk9L8jMWnyH3jLbMrOFb7hEnEHiJHoLyk3_EEiWNzrVKzJzz7ZY-MLivzCHdyqgo7haGdMmMWd_e9_2vvMnGII260bABKZmOJghmA6-vEb-gdM_xsNB8ha1KxtHkKZDRxLkScqNFVS3chNxi-bnjnDxC3tzWUxqJQMYM4ngmA2nJ2LCCniUESlQ)

### 2. Testing 
```
ping strix.operation.wise.ita05.com
```
![](https://lh3.googleusercontent.com/kTqR0JIkLmCwGEwDPH0C9Q8EsgjrBzQ21HyTGP3fuZGsW0k2Dta9ZE6I-G8i5PVzGgzXDLsEQpGGQKQULzKV3mbCKxCIRUXvg7n7oVVMdHleo9LBfGW160CPjn1DMgqu4ZrQ8e-qcGeNNNPRNDTKuFwCVH66nJ9emgTkOnShiwSzc-aHLVDClmMV9g)

# Soal 8
Melakukan konfigurasi webserver

## Solusi
### 1. Setup webserver [www.wise.ita05.com](http://www.wise.ita05.com)
Lakukan hal berikut pada console SSS :
-   Install lynx
```
apt-get install lynx -y
```

-   Test lynx
```
lynx google.com
```

-   Install apache2
```
apt-get install apache2 -y
```

-   Install php
```
apt-get install php
```

### 2. Copy file wise.ita05.com.conf ke Eden
```
cd etc/apache2/sites-available
```
```
cp wise.ita05.com.conf wise.ita05.com.conf
```
![](https://lh6.googleusercontent.com/E8fJ0_8yhtmLhuPf4oYS8waTo_20uCA3fOcZJH5AVHSXSRFc2SK3dbIanaPFDnnNZebwYiDHb3x9l7zm31h6LohurMh2S9KqDq7QL0QgGtOr3McHmfof6bucUp62vArPD9yddNqGxXdoWZxU7sxCp0QVX5qFiTQUlhUlZQPGzp4eLbANinLoYZF8BA)

### 3. Edit DocumentRoot
```
nano /etc/apache2/sites-available/wise.ita05.com.conf
```
![](https://lh4.googleusercontent.com/ze8PzLUcF8qW2hKAzRFFJ7csbbXQzEz9TXZVR0N_jEjoFhtoqAtqplqBwwxQDsxNC1n6ty03FvePRu11Qyjmvz40kVnBOt_3M_xY8nZBIsPUsX2I5yGM5D4942nIWBSflLvq8X8NvUFwfmDI1bvAgOJ6dp99XNxO1VO8_hzSXt3C9WFusemyJbhtZA)

# Soal 9
Mengubah URL Webserver dari [www.wise.ita05.com/index.php/home](http://www.wise.ita05.com/index.php/home) menjadi [www.wise.ita05.com/home](http://www.wise.ita05.com/home)

## Solusi
### 1. Cek /index.php/home
Jalankan pada console Eden :
```
touch wise.ita05.com/index.php
```
```
nano wise.ita05.com/index.php
```

![](https://lh3.googleusercontent.com/4bQxFN9HsRCP956dZqAAsjs1fA2LNqHqwv1XtPalzG6gX4jyaUc8Us_yWkLTJa-g2EnrIVNLF0N5nCmzLGu7AWrox5tVUxMq11s1dKCMfQZAnFT0OZhb4gym_tQiRyhxVrTFZQVnxG-C9CRHpvdZVwTKXtSwFLzhyO6CmFoVuswvF6rqbLL3jd18Rw)

### 2. Set HTML
Jalankan pada console Eden :
```
touch home.html
```
```
nano home.html
```

![](https://lh3.googleusercontent.com/BzmssiEdTDScXgGO2bGh0bZkM-GbRXxBWi-AONf0FBS8nYirWZQgHB7kfhApTS4eUYHgkPp9MSNItyxHNt2FIDLZBLYnvlyw8SIcV1UANY5na8xCHh5VZK0uk1XlBiQebr82M4gLt7ToBMVfKKW5H3-IbQaG0ticwbN1-xOI02DrU5ps3mRgigSK8w)

### 3. Install libapache2
Jalankan pada console Eden :
```
apt-get install libapache2-mod-php7.0 -y
```

### 4. Restart
```
service apache2 restart
```

### 5. Ubah file wise.ita05.com pada Wise
```
nano /etc/bind/wise/wise.ita05.com
```

Sebelum :

![](https://lh5.googleusercontent.com/j-5eNdGSxeSn_1BDi7lUhnxYJF4scUOBOspwZwuhSAEz-WwvCw_WtJ-BHLKRz6nJEioNC8alH95cj462tXNOEZXY3QM9WPuFCCyuG9SVPzmKv6FGBiE_SGfA1MQ_asT-E7q5qcMtg5O_jJXZhGeYZTr0oFY5PkiGQ6xiAfCTEHTdTspjI69veKkBgw)

Sesudah : 

![](https://lh5.googleusercontent.com/poUSf13ymERtg_Z5lZ6p--6bJctPpsYfRWdfL2G_lDK86tV0T5BTQA7pAK_eNdzZgkm1a-soXGYSCeiXfFhPfgJotuj9cUZKy4QD4ey5mS3fYwgndCafeuQNixsZtABkRg1d00xs8c_IRWzR3UGYh5OXeJ3BqznXxN6gaaS1StRnyaLNnFIK8byGNQ)

### 6. Restart Wise
```
service bind9 restart
```

![](https://lh4.googleusercontent.com/uOrhQYP1WPHvTua28-VFsEZWExRUFlM8FuLG80FBbGuhVCbToXMNVd62npNaI7NYTm-ydKMqqvoUSK6fGQ2hu2eT6qYmtfpVQf-X8_ZiOeYac0bRRB8Zf5XxGQcdxz4kFJObjBZYiVIR86HSRTyiYbKcRi8Z82zxCp7iibx6CwthsQiHcdaVOrV8Mw)

### 7. Set nameserver

![](https://lh4.googleusercontent.com/xn1FNstMY0PpUOftDCBHIW2GsQKijbmIVgHEKXAGu_15ZtrcmhVdN3EyGuc4GreiD6gpXxIE5rjgKlS7axcsQtGJudNgVso7EK24vwGEPs0HgMruaQe-k4C2GroWQ9AfKglGmRTU_pYZHWkjWrdd--RUA2pQrUOJHhXhYvl-yFZSpWp12C7y-4ZHmg)

### 8. Jalankan lynx wise.ita05.com di SSS untuk melihat hasil
Jalankan pada console SSS :
```
lynx wise.ita05.com
```
Hasil :

![](https://lh4.googleusercontent.com/5vsgS-iCVrhnynK4N91HoXlHFpgI4ZNF5eQdp1FnpDKXMRMEyv_sLP91W9izcqDDtikAy119EoZqunHkv1bGlEUC78IEc2shGV6PEZi72vvfoeUl5FagqRK_mcAU096DFgllP1N16PGDusMsqAk51DDk5vM1EIBPiW3B2sN3F5R68saQXiyfQQo_UQ)

### 9. Pengubahan directory dengan alias

![](https://lh4.googleusercontent.com/2BvVpExCUe-wLd2EQF-R2z4uQmdnBTf8zKpgaSxAXF1IZ9FywTF6r6vhi4bDL-hgaNoQDU-HVdeFKlYlSI2k-p2EwJgdSXP7BWfqigv1vnUjMf7Ln2l-ZQH8xiZF9BsI4FGt95bl57qOprQczY4N60LrJxss8ru9OcKSYGL1IRsKM1WRNuE8Lc9jBg)

### 10. Restart

![](https://lh3.googleusercontent.com/-xONbnkCAxpZgi5hz78o6J-X8SvJbBbFJIPFJEJRxe2pZfHNRR5L1B7VkHG1DbLiXCeWjPG2hr6JYBMMDo9tGkqhiOmvUbQ6KLPRNIOoUJ_DCuSR5blE4qRg-oyg7kCbEcx4ssabZ1KMjn00he3Ohr7C2unsrW7r3ej6sGlOXcPtrmZXxEs1sXEyjA)

### 11. Cek hasil yang tersimpan di wise.ita05.com/home pada SSS

![](https://lh4.googleusercontent.com/v60CsbyzcB4bPuTdDFaQhILheslPW27naE6UBuoSDO4VDgjQuDFe8tKWAiVu-tlwCyIrqDXter8OxgByiDjRG1T1V8qCj_uXCbSVnjoDR4AwErFNbvtTKC8x9Rpmb83CdLW7u-B8o4tqfYA_k8m3CUgl9Y0XlwwUwH7z2EJZzIc_xLOo2n4AbuSqkg)

# Soal 10
Set penyimpanan asset di DoumentRoot /var/www/eden.wise.ita05.com

## Solusi
### 1. Jalankan command berikut pada Eden
```
cp 000-default.conf eden.wise.ita05.com.conf
```
```
nano eden.wise.ita05.com.conf
```

### 2. Edit seperti ber
![](https://lh3.googleusercontent.com/iNu8ghcDkiFnuMCg-MVVov2ISd7myfdc4vjrJQXQxL5EqJOHHZIZAETvbLb7-aWOfLfbm4jBbuisSbfADoMVD-_nB2pNdShW7rWTiWo7lqhfL26JDitkOgIiLAS2w7wymg-KL7TqP_s7gxdDN_V0x-GffRz4wqxFHVJ6yUv7wFmGxS2iqzjW10Kg7g)

### 3. Lakukan restart Eden
![](https://lh3.googleusercontent.com/-xONbnkCAxpZgi5hz78o6J-X8SvJbBbFJIPFJEJRxe2pZfHNRR5L1B7VkHG1DbLiXCeWjPG2hr6JYBMMDo9tGkqhiOmvUbQ6KLPRNIOoUJ_DCuSR5blE4qRg-oyg7kCbEcx4ssabZ1KMjn00he3Ohr7C2unsrW7r3ej6sGlOXcPtrmZXxEs1sXEyjA)

### 4. Jalankan command berikut pada Eden
```
cd /var/www
```
### 5. Buat file dengan mkdir eden.wise.ita05.com
```
touch eden.wise.ita05.com/index.php
```
### 6. Lakukan restart Eden

![](https://lh6.googleusercontent.com/A2zgfY1MDVnEXORXbRjmvESCfEpeSna68Dt11Y0gJocDyULvgfnQjH2tATt-HqSHEIF90QXYlv0VCQVq8eDeASc3Ch22cHMhE1c6XMJgAyLdb_vIc_3yLMZPYpLXgwC9qJxomR0-U8FRFgDXnd8h1hjBzbOZGrvxgkU-FqKdsRb0rZzUBCYp7k1RRQ)

### 7. Jalankan command berikut pada Eden\
```
a2ensite eden.wise.ita05.com.conf\
```
```
service apache2 reload\
```
```
lynx eden.wise.ita05.com
```
### Hasil

   ![](https://lh4.googleusercontent.com/UwiscaPJmw0P36Z5jyes8HYVl9cIVa2Odh_vTui0UjRVNTQ92DLON3GnFAa7tzBg5brFvewbXk-b8jDRXGj86ARzlxOD7IlP74WG_jwDPrWNTzlFmS1-Bg2V-24NvonyN41P-ZLwabra9965BFkPHs17IRDghDSbVyJtKdsr7altURygu1qBUwb3pw)

# Soal 11
Untuk folder /public digunakan untuk directory listing

## Solusi
### 1. Edit eden.wise.ita05.com.conf pada Eden
```
nano etc/apache2/sites-available/eden.wise.ita05.com.conf
```
![](https://lh4.googleusercontent.com/KIjWnvtVzraiDgAdwn1CkjG0Y6JfaQ22CPfPcF8YX9YQZOeg1jVp7am5mUeSmZ61HJhVzuAYBRNxakkIrwcnvIs9m2luIVaAp38A8l3qv2qL7uSj6BWGNzjrMmnNaRytofFFlb7k35w06AcNza3_rW-gbs1xzIhjXOgwAtovfHPyuagJ1vW55eVQMA)

### 2. Jalankan eden.wise.ita05.com/public pada SSS
```
 lynx eden.wise.ita05.com/public
```

![](https://lh6.googleusercontent.com/mBZ7HIa6dQIjtqOKlo4kh-dEnLv4yKL-puF_FO6_6ZDzYo1rZUOQj-bm1EmPfh-1DQtzuY7DsfrategWdBLbYhRbGh6V1Na-YiUASM9bHWlFLkJqfoRPQA6aMeTw125J4j1KacIKonJyeWwhsvjfCmLXU7ZYydO7ClDRVtlTFqzOEhz9aiPZ-CpmbA)

# Soal 12
Diminta untuk membuat error file 404.html pada folder /error untuk menggantikan error code pada apache

## Solusi
### 1. Set 404.html
![](https://lh3.googleusercontent.com/mvbOZsK04GJNZ9RsddxQ5bZ2Ge_0Im23Rzvqr2ylC7w0wOG1360jFPFsMd4YVKB88pGVacxnaeUlg4hjBzCn_KeJ18SETrFM7_9pwVnlVLhsKX0OSwmUbmfxevKCYmBh9OVjDZbtADf3A10oZoHgbfSZtG0OOeXHPF9u889wFeTTdLOqzuF42tf27A)

### 2. Isi dari file 404.html

![](https://lh6.googleusercontent.com/VkmEJmzsWpAHCpU4Agsk63mpePwGGZ3hn1fuOB8fgcqRpt8P1ih1aCdK8ZAzrdAvhIdZjECmmu5gg9TrtyWMpAjwvTHTfOjUEChS9X-IfYWf7OeeexcuQgJeYd3uBsXhvg_1eaiRORbI5YiFXTnCBTYWv-VaC2xVyFQkfQxGeeglb4O1Bu5pwy_mew)

# Soal 13
Membuat konfigurasi virtual host. Konfigurasi ini digunakan untuk akses file asset www.eden.wise.ita05.com/public/js menjadi [www.eden.wise.ita05.com/js](http://www.eden.wise.ita05.com/js)

## Solusi
### 1. Pengubahan alias
![](https://lh4.googleusercontent.com/vAZMf2nPffkl2brK_X3VhDza0E634-J3dGO_RJDD64ljIttxzS9KiK1EArElQq8kBMkGxna6OpGVwh_T6Q00xt_itfWs2PCupHBti5kHmT1VyjeiBeMn8-13HWS4t7ZoGBZz0LhKSJZKH6lVOY-vcayxTk_wwREFwtz3ap6geXmYZQunUWMhaMWHgg)

### 2. Cek isi www.eden.wise.ita05.com/js

![](https://lh6.googleusercontent.com/U1gqBMwAzCBXNncuhN7iI-ZZCOnzfMoak4JOvA9Ld_wG4Z9vkNP_88uBxsYQ9ykU4QRLA-9Xy9Ckd7doljG-lOgulIdVNMch9MFWaiiOMSp0mE_XHc7KXJaF1BwGIt0jgajOk-RENwRwbftUqH4VG5738AChOstto-K0SXYSLBtv270IoHHZPagZqw)

# Soal 14
Diminta agar ww.strix.operation.wise.ita05.com hanya bisa diakses dari port 15000 dan 15500

## Solusi
### 1. Copy file config 000-default.conf ke directory baru strix.operation.wise.ita05.com.conf
```
cp 000-default.conf strix.operation.wise.ita05.com.conf
```

### 2. Kemudian menambahkan port akses  15000 dan 15500
```
nano strix.operation.wise.ita05.com.conf
```

![](https://lh4.googleusercontent.com/2Qz3oB2NgSMB30Wd8dI-_Joy9sZv5r7xVdD2dUkiVlGeDCNHbivUIYAsW4CuYhY9mTrkpdM6tcU2VTAWintBYnG42YfvXIWLuXFVVnZBZOyZJ4kpkJc_CCXefBAscyveN0inORUGC8nHh-JmJ7jebtPdQMJJ2j9eo9xqabECoZ_WcdtoDL5VlL_yVw)

### 3. Kemudian untuk menambahkan port yang sama
```
nano /etc/apache2/ports.conf
```

![](https://lh5.googleusercontent.com/dUqTePwvmHrGarY0-Kc7fQu39JCaq-cdTLzxCbiRhhO_fNO3NGJpE1cVNz7vvL66u5f2qDEkSIFNGjcfRagtosfYjnN9YD9E9vZUfePJkR_OjwCM__If_Jox2Qa-DWR43IrTvQvOu25o4vwd5aJH-lTU72b7Ry6krrxNM7PI1wj9QytgVWpHAh3b4A)

### 4. Kemudian buat directory html di /var/www dengan format strix.operation.wise.ita05.com  
![](https://lh5.googleusercontent.com/vG9-x-Z-e7sijvMfmtp7b02NsQnU11PXvEzJFjU0cx7otQwIw1_9z3C5llrCFjQMlQNfQlaNkrwMNqtvjVBMUYJOjc_YxsgYX67rmbloA5awpEEyLIURQSC6iLrz8ej8MxXBpBJ9Mfsaz-5TOqo7n6omaJNFuSnI28zGevPQ0tZHRrvEcijeTy9YsQ)

# Soal 15
Melakukan autentikasi username Twilight dan password opStrix dan file /var/www/strix.operation.wise.ita05

## Solusi
### 1. Set username dan password sesuai yang diinginkan soal
![](https://lh6.googleusercontent.com/epJ3NPaplV5giR-GThLh6dox0-pJFBFauQGce-8O9jhxaHGZAAvzU2Gm2D0ex7mF_pCFkk4j_6N-2JE9Iw-LK3bymDi7uLmZhC5oyvpypZraNbNvwSjNF1fCZNwGCmby7sbHXKfpEOQha2t4XcFJElqQ72pX8SBQlM42pR_7XIjwY07ynEABohkjTQ)

### 2. Set directory untuk require permintaan username dan password
 ![](https://lh3.googleusercontent.com/ZAqomvvUvT_sl-smW3aVvUbRmAMHvOVRX5RUYWD7QN9sKTuLtKFcO8bHVGLurpuF3uUJQ5TqS8vnLG4Bjl5ti7k1O7n1EcujlkH3TuJm4NUBf0CbAhiyyzxjFnuK5-JkrtvDAltHtYaR8StuPAJC4eQyogBFT29NYraUQ_gyUJ-RPwhKqQPrcUA_iw)

### 3. Tampilan setelah dilakukan set username dan password
![](https://lh5.googleusercontent.com/JN6JIDUFOzfEzp_Mm2NjGUlWiCa-6biVyDExlJviZdlnIRuo7vU82kIQFaYGUkTT69JkBt1GtzXd7tF1lcL1FD_hQmUvN_eJkTqDi4wxV1Nwda-6fd8Lk-VG-bDtUuiazkc5zhQQIUksde_PP1-XOpyrDr3lzSTRyBnyblzDB7bSplInkhjG13LL6g)

### 4. Tampilan setelah username dan password yang diinputkan benar
![](https://lh5.googleusercontent.com/iBQ-bV-pfiVoVR-EWJUM5bYLsNvW_4U1PB_wRpheTavOjQVZgSBt7zrX4weBVhvWtBLgLdC8ObAOHdhHpP9gWnT-KFM4FvCX8m7SzaJknYGzfwWux9JQghCFOnVzUyngSV9dlxFlpe1VAFqIxQ-QUdZg9_wOqIPTW9FCPEuqj9VdaJD-qdxFUc84Fg)

# Soal 16
Mengatur dimana setiap kali mengakses IP Eden akan dialihkan secara otomatis ke [www.wise.ita05.com](http://www.wise.ita05.com)

## Solusi
### 1. Cek apakah IP Eden sudah bisa berjalan

![](https://lh6.googleusercontent.com/Cjc6oYQqad_6AtrneWksIDjuk_dL0-PllxUePcO70Q0oPMgn3rVK4XSJJXSj5R1j1M80EQT0BilFbEcA6F1g244IEjIgJsPuUhRAy38zwX6O9YKudTE1KLr7SUa6dsQ0rK4lTV3rtCgP5nt9HKK1CyrPPuJQoRy8QDrcwQTkHRzuUtv6kVhHUeQpAQ)

### 2. Kita set redirect pada file 000-default.conf
![](https://lh6.googleusercontent.com/nkY762-JdE59B8ozicD0B8LMSs3InVdGFhCXLFuZ6frJjtJS49Xz4DXh0kH5nOtykEACQnxbyT5Zn-cjjumH9FI0OKqO3QrLnU-cg5vGBBAxzl7b_ZxFzFROgGvakph3NayfKDfJypMXtK-064PLm3JuwEg7YzzuJmVyzHK39UkVyZWQiPFuCJ4Dfg)

### 3. Kita reload dan restart dengan menjalankan command berikut
```
service apache2 reload
```
```
service apache2 restart
```

### 4. Kita buka [www.wise.ita05.com](http://www.wise.ita05.com) apakah sesuai dengan isi dari ip Eden\
![](https://lh6.googleusercontent.com/hwanbntSUDdLO0IDyeia8fSWR9BR5ZD58XVFrpBxRhObifqgr477wiD1JkaplUclP0uIiZNVgIdZPBvD49Q7I0JOlIwsGYN0qC_EXkrZKhCjZrUPMO1jg1csW4u2Y61BcLzf3hcm3I0yHRbvi8oAfOlygVWitarUkDjSWI4UVrJgWrTRrJE5pgqtsg)

### Hasil
![](https://lh3.googleusercontent.com/Es9rsxbYT8nCtqDweyJOLW5AMI-Ec-nydSCFhp4yyW68wHt2ttLOdXS0TJLcqnXabGGvuXaDn6WSEOJ05AP7N3WMpzgpjJYMQO6cm6X3yFWTyjQJEaFsn0quRsi_4Sa2CoI66715JMrS4nzJY881n8xIW9K4r60_X38kkMn70P8blvqq0w8G4Kriyg)

# Soal 17
Request gambar yang memiliki substring eden untuk diarahkan ke eden.png

## Solusi

![](https://lh3.googleusercontent.com/9a0JyNP0Pl9QcPiIS4zw3_MXLxXPELBtHpQmNUMwTd6nG6tqmx53mVYOHZVYUYtIq1nSNCAkTJUKhfY-MYkhK2ULayfJEn_Z-iAdQe6iKvTfInI7K8K1TPqNpqxdD2nH98h_GCI0GxqpHX6awcQfGXo99dJc2EaqLapmPHxvOQiCrtaNx4TYXaIviw)
![](https://lh6.googleusercontent.com/uDhjNM-GBmqSQ060vE-O5ppw-HGmG9GW7EX6WFxAg-vVON6PseV2WCfL-8jgTkm4Suvx4X6kIyPDu7yo8INB1bjl_DlzVZ65RnuAB3KkkxnJhlFpGq_QADQAJL5-jBXP9BYfjhbycwS96ynwb-hTeA1nOMUzbaEA00zQhz27dDzvMP69uhTxWV1Mng)
![](https://lh3.googleusercontent.com/c4e8v7pLSSOIYb33R0AUJ0wFlA855cpwEBs3Ib10-6xsUSI__g6dcFIKLdQruJjsIq_0rkQQHCQi4s8tzF0_5Z5WAC2ZEqoM_aFBF3cE2iAXbvdbzgXu8f2Z0qu5sAcRbB-rbAAU4mFUmJmLIjYOEmSJ1ee4rEXcvbY7VksjQGO-3OHog0wN8vnuMQ)![](https://lh5.googleusercontent.com/7jfwCY2Ruh27vrhNkanlEPRxemH5knkBEEmjyKi6qcQA1Sl086Bp1PthDdgvgmha3Y_sgvuCS9DyKBES0gyv5ikf3V-g1op-OWtmwEotJhZnwGermzKUbNjVkfLmuuMBi1GoAi5UBijjZKevTeUIzUOuMK_KePwKRAQllMwdiU6AqXpBqGgEAsIMtg)
![](https://lh6.googleusercontent.com/UD_ux4_hh8L01j87edvg03zcwvnXaad39D4e6_1PXmqcCA_aqvzqb5eG68hkwAqHptEVNmqBr5yV1C2ZA6-Od-ZUZghKdVWWUpw0H1uM0rorZKiWw2ZwBD20fP1vmq9zs-76orE3AvAqv2yFZ4kb2JlC14wKoXRxcWyOI65Imv6AoURd0pqrFZ3Yvw)
