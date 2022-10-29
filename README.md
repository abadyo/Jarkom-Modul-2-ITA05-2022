Jarkom-Modul-2-ITA05-2022

Muhammad Hanif Fatihurrizqi 5027201068

Abadila Barasmara Bias Dewandra 5027201052

Fadly Rachman Drajad Juliantono 5027201038

1.  Diminta untuk membuat topologi dengan spesifikasi sebagai berikut :

WISE akan dijadikan sebagai DNS Master, Berlint akan dijadikan DNS Slave, dan Eden akan digunakan sebagai Web Server. Terdapat 2 Client yaitu SSS, dan Garden. Semua node terhubung pada router Ostania, sehingga dapat mengakses internet.

![](https://lh4.googleusercontent.com/RVXzp5am1pnirpEyvP6H6FhQd5pF4ZrqNLtmJJKkSFg9EuHxIJMTpjiLZBjHarVpFnwuvFIRqY7SUp9uJWyrEzMcSupF5hUPCyvzvV53XmIiN_vXMbo63Gap_3Dbj7foDid4jaqxWlFRvt2RnSDoQbF-v3AD-JV37K7eBTP2Bu_4z73uHRl1-AnmHA)

# Soal 1
Diminta untuk membuat topologi dengan spesifikasi sebagai berikut :
WISE akan dijadikan sebagai DNS Master, Berlint akan dijadikan DNS Slave, dan Eden akan digunakan sebagai Web Server. Terdapat 2 Client yaitu SSS, dan Garden. Semua node terhubung pada router Ostania, sehingga dapat mengakses internet.

## Solusi 1
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
### 2. Edit file `named.conf.local` dengan menjalankan `nano /etc/bind/named.conf.local` dengan menambahkan :
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



1.  Membuat subdomain wise.ita05.com dengan alias www.wise.ita05.com

1.  Install bind di WISE dengan command "apt-get bind9 -y"

2.  Edit file named.conf.local dengan menjalankan nano /etc/bind/named.conf.local dengan menambahkan :\
    ![](https://lh6.googleusercontent.com/0ZgX4BprhwOKnGKKXcdy75XFG2GO6519gjOBSD-UdVVm2GbgC9NtzxPf8Lji9CB5Nw5k8Uzjzek6vm1rbhb16eugyQJ6daYGStwjqjpgqKDz_PRAvR7I5PF5AlZFoi2Fk8ICOD_3Jeao2YxiacMxJNyQhEGfAc_XJ3ALr67nc_QByDVXnCOFGhf91w)

3.  Edit file resolv.conf di SSS /etc/resolv.conf

![](https://lh3.googleusercontent.com/C4sXZcAdWXfZh4ShT3xELZZJaO2vxkMnNqTHA97mkefc56uXej-riopE2v-LmAUVokHXM4PzMFaKutHWm34pqFXhvnGoyBmDZGur7dJykIfX6qK_lGAvef_bbKgea0fiO1nDV83WB1KlYJFpzHi1n1AiA0zh_TcrLgWGuu9fqaW3fSwvFH80q_Kw_g)

Testing website

![](https://lh3.googleusercontent.com/3fqWBHgl4EQAU3n1ztcxFnzspRnaNS4L1Twf_WDQRS0afBeTTXBWT062r4w6uD3HrArBYAbGUq-ilnBiguEVSVNHmUkeUrrNLCdSem5q3wYAFYbgMgJLyIdTf_QE6ky0mGU3IbnD40rI5CPhlf9V--Is2mLooKpj3H8j5WdkXR6onaW3Nw_lCDtswg)![](https://lh3.googleusercontent.com/_ae-X53KOkwyFxsEVMMTi5-cCPXILU5HeYNt64KH-uFGswDB8q4oGUXLN5pWlL1tWcOHWaAEKMJF2r2MJL9QLmTkhThKdSskCGIa47bRG27rhLQZdWRbJ5dFEaER3uvff0qsufykRTVsBgnuyZZuunDhun12cbjmc8STio7J26zsdTR2VMFPPuB9mw)

1.  Kemudian kita membuat subdomain eden.wise.its05.com dengan alias [www.eden.wise.ita05.com](http://www.eden.wise.ita05.com) dengan mengatur DNS di WISE dan mengarah ke Eden.

Filenya diakses melalui wise/wise.ita05.com

![](https://lh5.googleusercontent.com/rgGu9b4pT9h40719lyGzk0ydRuP7RCoT5QXXZyt9NrEI7474h6TOGcXG6QTpozrr8R-sjWYi_OKYDxdFYjhsLoLVD4nsMKF6FIh-2469SKgoK3dTCfrw0D6hcUbVxPFMob7voBZq_pj36mCZp9_saoAat0uHvJ0ESebsekJWr8NhQXqs8T0zmmtgIw)

Testing subdomain

![](https://lh4.googleusercontent.com/8Jb6zTvIEbuU5URSHQDwyDWHdgaYKCFrIndj6doJ6prqdh-viVYCZrzApa4Xq6s5zUX7F-DTQ-3sNZ5h9z68kUIUl-yaCKSlDWeSP1gGufgG-QkMoHnvVn07vLAi1eNMEVX1NqxN3AUzRB5_MnkOkm5SoyTOoLyF6sgSQg7SxEF0RwKrQsDmUWIniw)

![](https://lh5.googleusercontent.com/WSLScNO4XQPgJNGh11XGG1BroczU4BKnz4QplwAQ0He-Cg_9iv94hPPHO5xsSQbWoyvXV-GQL5DAAirDpTHw85OJdy_NTYoaAFro5PGlLs1x-OC2ouDcnvs2RlfCntOBPLPCK1y_DUK477WNjH-ppymtMpNY6R05wyHLKgplWSx5FC9DgabXoLBL2A)

1.  Diminta untuk membuat reverse domain untuk domain utama

1.  Edit file named.conf.local di WISE di /etc/bind/named.conf.local

![](https://lh4.googleusercontent.com/nuJX0IMcCP3XLxt7mNiUnBPtWsZr8g9u5XTzWHztTkSJJ_O0TfmgTrg8IrAY2n4fLFXgBENliU6t_EhGuljUKXLeG_mS0SyxxB2KUtTIRMDkpwcZSjWjDmGe6E-7fvcWYlfji5Lc41OGAGMlfvKm1rwmqGQjD15tO_Rj5eiRS6-tmNoQq_0l40Rt3Q)

1.  Edit file 3.42.10.in-addr.arpa di  /etc/bind/wise

![](https://lh4.googleusercontent.com/Cobf71XNRoaVHeBuE8fgWo4xCHNXg0fGSThNnyrjpy4NrQmmtOPHyVevgbc9xtmH0B_XgVpPgazFRzZdDzg66aTxQBBIN9ICv__-idqV1t-ji0LvGWrJUiac8R_M1-DtQWJjHW-xZBx3IhZVhZRpRZ1HBXc0GlADdHyf4ekd474nmyuIuYfaWiLG-g)

1.  Reverse DNS dari 10.42.3.2

![](https://lh3.googleusercontent.com/qHiTBAFkB9lDi7k_stjpX2oVuOk7q-1ZGE9eASLm5Urd5Cp5VUz3Zv5vk0Kq8Zevqo74B_iKKhDd5x3-fqHGegGeDaO04YtjlEnsDI8A-mz-NemYD2S2cguXI7m7AiJDQZoR2GKelzX66qCE7eG-Letz25QExWlfrjpY0A60qf0NViLM2LdfEJLS7w)

1.  Membuat Berlint sebagai DNS slave untuk domain utama

-   Ketikkan nano /etc/bind/named.conf.local pada command WISE lalu isi seperti berikut

![](https://lh6.googleusercontent.com/B-xJ8mc-YU6rn4IGpAZ_JBuHar8ubHUu0U3UFF9iRm3NKr7WYrOQcbDDjptCEvPdqUrkOKuZVm1Da_FTedBF2ePxZAnmFYzdT7NoVUDsNnIVvB4xH0LECF06z7lDBj7NErO3aPBze0D9KwFcB4xJb9xB7KLUCTfh8Ff_cVTqzT-hTNwxfeD9fb6S7A)

-   Ketikkan nano /etc/bind/named.conf.local pada command WISE lalu isi seperti berikut

![](https://lh5.googleusercontent.com/bWSUvubh_3rOWPSlV-yqMkzRIlEtLVkF6DnIXdDvVDoGQsOi-HG-T0ePIqcCV42SRLrEs6nY_NgJX6gZxOY5zikKX3B_hOkmkziU6-95O7KBX8E0xjLhHJ4pn1rdoa5CywgG8Ly48gQq5Z8nJiycXEQvQq3hyhL0u_UXNuVoC2sH76VhXF9lbgUfBA)

-   Lakukan restart pada WISE

![](https://lh6.googleusercontent.com/bNGsfLB9VbgY4Sr9x0mj1J0dLHIpEV7RsvAVIAb7ke39LA2UwEXwRLhoPqFcblSP-kZycxRls0URFn6T1UJRC3kiGP7p0DtISYK-ae4dvKhxvoRmHlOzPRCcTsruOKGlEIfBiyc7QT5OEMed-8GxXVuJ1-_juEKDN7Jk67H-9NeZIJ3yqUHosxjDQw)

-   Test SSS

![](https://lh5.googleusercontent.com/MFddb_mXoMbScVhWv_Ij6TTrs-1n9DCKfhiC_li0AzHU4ABxZMKW-fe88-dVFrXSGWRQKQafxroyG145F0oBV847UswkO1OXwl8jZp2jRanwe61F5aQrJc-YK_79B-z1CZ7KhIk6TEkp2ES-dDTyzrro6wug86odkK3TLhkul8Itt43sxH6dEoSWRA)

1.  Membuat subdomain khusus untuk operation yaitu operation.wise.ita05.com dengan alias [www.operation.wise.ita05.com](http://www.operation.wise.ita05.com) yang didelegasikan dari WISE ke Berlint dengan IP menuju Eden dalam folder operation

1.  Edit file wise.ita05.com di /etc/bind/wise

![](https://lh4.googleusercontent.com/0DF5M8amOIZvqMmdVwFQgxWyho2eAdmTsFlVp-sBuke-d-fTpuKYkTADFOIwAueiKPN2B7c9ezfWS5rDMoG1DH3kswR6Dw9mIgrKADrjelaB0GcTNVeKZS9KS0vX7EcVBAZUitH8gUbaoO_mGN_rqLYuUAfkiji2DZ1yb7GZqFyWYihFckRfZbbuHg)

1.  Edit file named.conf.options di WISE /etc/bind

![](https://lh4.googleusercontent.com/npXfiIJocsE5K_pSMhRYs7jPrxKLjDOEJbcowvukjiY3tjIrqucsgLIdjSVF4EBeSSdPDRLnH1GmDjH-egUOzy_ygk79VsgHWKNac3bXqT_RjIt_wxN0CVKZyagfyKL9g-GPnZhAninm9RR51rahN6kDne_tE8qWZtA-e5WnNr9oRjgvy0FHgZ4wiA)

1.  Edit file named.conf.local di WISE /etc/bind

![](https://lh6.googleusercontent.com/kE7lwoABvKDB8zfL2Kex-ziV1QPq5bCIurcucva0pU7g-4HQ5myPw_Mn-yev4qYJTYgw_sKHOjvvwGD1rPjKkqUk3YbTYdVFVW_SC2SZ5EUIDfRi2y0cZ8NavE8xg8z0NO9UIE_gtBaQdb6zulF0_KUcUF2FZ-MwaxnI8Qdo3gS6ekWv-va9rz0Sow)

1.  Edit file named.conf.local di Berlint /jarkom

![](https://lh4.googleusercontent.com/DTYFSWcHQ7upA2lY6pO43QhH2wXvn9KafRLiDfGyGMKMk0nzzrcG-tgm3-p95yCljzoe2KoxeXimyLp9biaCQulYLkzMv8c1O_cYsv_1W97ouIcvyvtNw1Bz_BsoRDsearH5wLeZyf-rL0Z4GGln0o6wgdHqNaytCmJrSK_-iH9bItx7mfVCeljbTw)

1.  Edit file named.conf.option di Berlint /jarkom

![](https://lh4.googleusercontent.com/ZXAt7aRbn6MO-epucgIM-QRV3fk5ETXJ4SnJP0hQkq7dnfmfnxaXuwRqj0Mnp-M79RTpSDgpGZMJxn_aNwGA-q8LYoPDq30DrpJOaLBqEbEztwlVOCq46SXNhbOdjzeU1vEhP9AJy3kwtTFBunQpFY8SX5oACZE5we5AGg2ndt8-m270d_nXaPSowg)

1.  Edit file operation.wise.ita05.com di Berlint /jarkom

![](https://lh6.googleusercontent.com/Vp36IDQ0As0NGYYkfdo9uUDKznzr-8anYP-aqTVsXEGNRjcdHTa65LBTgKHe3n_9c_wQEEdkkkR6aOoDulwkcQoU-vjzVkF1b3V6RDymFSVMQjAhzVRa6hNYKfWWyyKSbGuGe36CEYqU2jY5Vvqk5I8hCsPSKsaRCW03wlGOQF52QRjarhir2ld7SQ)

1.  Membuat subdomain melalui Berlint dengan akses strix.operation.wise.ita05.com dengan alias [www.strix.operation.wise.ita05.com](http://www.strix.operation.wise.ita05.com) yang mengarah ke Eden

1.  Edit  file operation.wise.ita05.com di Eden/etc/bind/operation/

![](https://lh6.googleusercontent.com/_uBRk9L8jMWnyH3jLbMrOFb7hEnEHiJHoLyk3_EEiWNzrVKzJzz7ZY-MLivzCHdyqgo7haGdMmMWd_e9_2vvMnGII260bABKZmOJghmA6-vEb-gdM_xsNB8ha1KxtHkKZDRxLkScqNFVS3chNxi-bnjnDxC3tzWUxqJQMYM4ngmA2nJ2LCCniUESlQ)

1.  Tes ping strix.operation.wise.ita05.com![](https://lh3.googleusercontent.com/kTqR0JIkLmCwGEwDPH0C9Q8EsgjrBzQ21HyTGP3fuZGsW0k2Dta9ZE6I-G8i5PVzGgzXDLsEQpGGQKQULzKV3mbCKxCIRUXvg7n7oVVMdHleo9LBfGW160CPjn1DMgqu4ZrQ8e-qcGeNNNPRNDTKuFwCVH66nJ9emgTkOnShiwSzc-aHLVDClmMV9g)

1.  Melakukan konfigurasi webserver

1.  Setup webserver [www.wise.ita05.com](http://www.wise.ita05.com)

-   Install lynx

![](https://lh5.googleusercontent.com/NAKp0xSUTuQjIOTLIGz-g4OwCNCUorcj3fgmvOELnBJYTCw2PruDDkDewYVfMgXCb2z1OO58Jb4kGJukYWxQvdnys6X9UOofASc7mEeMe1RRyYA90WdweCd8YxCz0t-t1wkyvLgkyP0L21LgHvWLUgJU8q3EJaPf3uNPf1VDqlPg7hrISmEfqv0lZQ)

-   Test lynx

![](https://lh6.googleusercontent.com/rY-WY0tXfnM_-O0cxXd5WVAp_PFGliwGbp1YFho6qwO0A4MzFpcdhmfoqa00Uw1htC2DzIP4WHbWiScOUp_1OdjYMDwWYAkjVTzs17uInx0shm5EJgMfh-hsy-mzy8Vl5m6hgE7oAhfIR2Ev1uCoGd4cqbr3i8ha1ecvh6C4Ba_CwZXunhGu_hcv6w)

-   Install apache2

![](https://lh6.googleusercontent.com/HmyExZ1bDwf5xXVfyCq492lcilEAvbDiuC2BiwURlimW-4l9JWBFQ_vnHhfMYLTvYk6E-JNS7LEo9m7wgkkU4XKsVBtEKhSCUifufyK66vtxlcResUcN2dl5qkJ7yeOa72iHXDMRD8uQmybSxeBYYgTpI6-gI8i2TL-ZEeQo1ur8OWVmXayiJEATUg)

-   Install php

![](https://lh4.googleusercontent.com/YehVLkqSSffhBluoiKSS_4yMerTCGUQQAtZgzJBBSA5ZUgTXVETtC3lL_xMSiQCSgPOnIvMS9ZCsjMe1qzrLkJjSszRop-IfrE9DMc8L0zLuFZ3QDujn3-yvFoLiGMIaieExpK2BmeRWqdHeJ6F-ME4WUZ2oivRdLaoex9G-_aY2PsZ7k6iYk6B6PQ)

1.  Copy file wise.ita05.com.conf ke Eden /etc/apache2/sites-available

![](https://lh6.googleusercontent.com/E8fJ0_8yhtmLhuPf4oYS8waTo_20uCA3fOcZJH5AVHSXSRFc2SK3dbIanaPFDnnNZebwYiDHb3x9l7zm31h6LohurMh2S9KqDq7QL0QgGtOr3McHmfof6bucUp62vArPD9yddNqGxXdoWZxU7sxCp0QVX5qFiTQUlhUlZQPGzp4eLbANinLoYZF8BA)

1.  Edit DocumentRoot pada /etc/apache2/sites-available/wise.ita05.com.conf

![](https://lh4.googleusercontent.com/ze8PzLUcF8qW2hKAzRFFJ7csbbXQzEz9TXZVR0N_jEjoFhtoqAtqplqBwwxQDsxNC1n6ty03FvePRu11Qyjmvz40kVnBOt_3M_xY8nZBIsPUsX2I5yGM5D4942nIWBSflLvq8X8NvUFwfmDI1bvAgOJ6dp99XNxO1VO8_hzSXt3C9WFusemyJbhtZA)

1.  URL Webserver dari [www.wise.ita05.com/index.php/home](http://www.wise.ita05.com/index.php/home) menjadi [www.wise.its05.com/home](http://www.wise.its05.com/home)

-   Cek /index.php/home

![](https://lh6.googleusercontent.com/SpWTSWmp8w64loRcV7vgFpoAfr0MQGCAbhQ-Y1V49_2QxYnO15l1O3_jNaReeBhEFvxyrfPAEa5lrMSRWiOGFVUlU7vuGRNvyvKxiIkAKYzyAcB8FSOUyCrfJIdKO-F8DK88zdrKnfvxTMA1Fxp6lnvpG4xv9JONCU2m-xARS3UwCIxvNIjeP2cZIQ)

![](https://lh3.googleusercontent.com/4bQxFN9HsRCP956dZqAAsjs1fA2LNqHqwv1XtPalzG6gX4jyaUc8Us_yWkLTJa-g2EnrIVNLF0N5nCmzLGu7AWrox5tVUxMq11s1dKCMfQZAnFT0OZhb4gym_tQiRyhxVrTFZQVnxG-C9CRHpvdZVwTKXtSwFLzhyO6CmFoVuswvF6rqbLL3jd18Rw)

-   Set HTML

![](https://lh4.googleusercontent.com/hVaXEmMX0UPlxeC-k1YnUNDNWfrd92r9baeqBazoUGU30W_BEmvrQYHgcNvhxWrRR7HWtbJ5QaRe7--y2NMFSYvQt3uaAkbzhW7z34UuL8Kceozlp-xILEgpHH_a77fpB_AE5tOw05pd73QrI59Tz0ngtuTQlpV6Vo9bZhHuS4A1VZ_da4DTAFd37g)

![](https://lh3.googleusercontent.com/BzmssiEdTDScXgGO2bGh0bZkM-GbRXxBWi-AONf0FBS8nYirWZQgHB7kfhApTS4eUYHgkPp9MSNItyxHNt2FIDLZBLYnvlyw8SIcV1UANY5na8xCHh5VZK0uk1XlBiQebr82M4gLt7ToBMVfKKW5H3-IbQaG0ticwbN1-xOI02DrU5ps3mRgigSK8w)

-   Install libapache2

![](https://lh4.googleusercontent.com/Op3D24muc17gPF_rOSkf8SVDvmjiJ8QPPaqQC3VNfVQd1ioorWpghBn2qXIdiVggUVRONYeJ8ULwwdE0GejuUyUSEyCs6QHb9Q496-GYda_q-9imVSrLavqM_hI-k5Mhx4Yv6Wi_Vax-LXkMmo8zQH0nqPCEQskHHwAs-AEyvGGNyHd4unL4blLf_Q)

-   Restart

![](https://lh5.googleusercontent.com/BtI7xH8JN51Sgj1dhxO5t857o9HAls8huIClp_-MROUBXyeB46vWPrCaS1YaLMIhz1PSXG3mPSPSpqYOmEqMe6GuC0R6dG-y_b0_pz4HSRA0scJhY5gyt0a5PD6P2tLxRamwWQ7R4KJFBWlR_NsgHXEAMTYuo-6ipbNgFK3F0VxNLldI30apvc8GHQ)

-   Pada Wise kita ubah /etc/bind/wise/wise.ita05.com

Sebelum :

![](https://lh5.googleusercontent.com/j-5eNdGSxeSn_1BDi7lUhnxYJF4scUOBOspwZwuhSAEz-WwvCw_WtJ-BHLKRz6nJEioNC8alH95cj462tXNOEZXY3QM9WPuFCCyuG9SVPzmKv6FGBiE_SGfA1MQ_asT-E7q5qcMtg5O_jJXZhGeYZTr0oFY5PkiGQ6xiAfCTEHTdTspjI69veKkBgw)

Sesudah : 

![](https://lh5.googleusercontent.com/poUSf13ymERtg_Z5lZ6p--6bJctPpsYfRWdfL2G_lDK86tV0T5BTQA7pAK_eNdzZgkm1a-soXGYSCeiXfFhPfgJotuj9cUZKy4QD4ey5mS3fYwgndCafeuQNixsZtABkRg1d00xs8c_IRWzR3UGYh5OXeJ3BqznXxN6gaaS1StRnyaLNnFIK8byGNQ)

-   Restart Wise

![](https://lh4.googleusercontent.com/uOrhQYP1WPHvTua28-VFsEZWExRUFlM8FuLG80FBbGuhVCbToXMNVd62npNaI7NYTm-ydKMqqvoUSK6fGQ2hu2eT6qYmtfpVQf-X8_ZiOeYac0bRRB8Zf5XxGQcdxz4kFJObjBZYiVIR86HSRTyiYbKcRi8Z82zxCp7iibx6CwthsQiHcdaVOrV8Mw)

-   Set nameserver

![](https://lh4.googleusercontent.com/xn1FNstMY0PpUOftDCBHIW2GsQKijbmIVgHEKXAGu_15ZtrcmhVdN3EyGuc4GreiD6gpXxIE5rjgKlS7axcsQtGJudNgVso7EK24vwGEPs0HgMruaQe-k4C2GroWQ9AfKglGmRTU_pYZHWkjWrdd--RUA2pQrUOJHhXhYvl-yFZSpWp12C7y-4ZHmg)

-   Jalankan lynx wise.ita05.com di SSS untuk melihat hasil

![](https://lh5.googleusercontent.com/SmslvpLMXWoi86G67WIxBRqv3CzIHwiJfCCTiqEHNzifMZOVVkhnneHS-84PG5BT3xUXq9n7JXFjE4VbnFPFBv5fFd4e7fUsI37Qti2Mj4w5iSfdTF3wEv949jEavowRf1Hy3gJxcd2GcNH4u9tBEn89fceLdq_YC3nHHvANzSQEcnCKFsHaSz9fnA)

![](https://lh4.googleusercontent.com/5vsgS-iCVrhnynK4N91HoXlHFpgI4ZNF5eQdp1FnpDKXMRMEyv_sLP91W9izcqDDtikAy119EoZqunHkv1bGlEUC78IEc2shGV6PEZi72vvfoeUl5FagqRK_mcAU096DFgllP1N16PGDusMsqAk51DDk5vM1EIBPiW3B2sN3F5R68saQXiyfQQo_UQ)

-   Pengubahan directory dengan alias

![](https://lh4.googleusercontent.com/2BvVpExCUe-wLd2EQF-R2z4uQmdnBTf8zKpgaSxAXF1IZ9FywTF6r6vhi4bDL-hgaNoQDU-HVdeFKlYlSI2k-p2EwJgdSXP7BWfqigv1vnUjMf7Ln2l-ZQH8xiZF9BsI4FGt95bl57qOprQczY4N60LrJxss8ru9OcKSYGL1IRsKM1WRNuE8Lc9jBg)

-   Restart

![](https://lh3.googleusercontent.com/-xONbnkCAxpZgi5hz78o6J-X8SvJbBbFJIPFJEJRxe2pZfHNRR5L1B7VkHG1DbLiXCeWjPG2hr6JYBMMDo9tGkqhiOmvUbQ6KLPRNIOoUJ_DCuSR5blE4qRg-oyg7kCbEcx4ssabZ1KMjn00he3Ohr7C2unsrW7r3ej6sGlOXcPtrmZXxEs1sXEyjA)

-   Cek hasil yang tersimpan di wise.ita05.com/home pada SSS

![](https://lh4.googleusercontent.com/v60CsbyzcB4bPuTdDFaQhILheslPW27naE6UBuoSDO4VDgjQuDFe8tKWAiVu-tlwCyIrqDXter8OxgByiDjRG1T1V8qCj_uXCbSVnjoDR4AwErFNbvtTKC8x9Rpmb83CdLW7u-B8o4tqfYA_k8m3CUgl9Y0XlwwUwH7z2EJZzIc_xLOo2n4AbuSqkg)

1.  Set penyimpanan asset di DoumentRoot /var/www/eden.wise.ita05.com

-   Jalankan command berikut pada Eden\
    cp 000-default.conf eden.wise.ita05.com.conf

nano eden.wise.ita05.com.conf

-   Edit seperti berikut ini\
    ![](https://lh3.googleusercontent.com/iNu8ghcDkiFnuMCg-MVVov2ISd7myfdc4vjrJQXQxL5EqJOHHZIZAETvbLb7-aWOfLfbm4jBbuisSbfADoMVD-_nB2pNdShW7rWTiWo7lqhfL26JDitkOgIiLAS2w7wymg-KL7TqP_s7gxdDN_V0x-GffRz4wqxFHVJ6yUv7wFmGxS2iqzjW10Kg7g)

-   Lakukan restart Eden\
    ![](https://lh3.googleusercontent.com/-xONbnkCAxpZgi5hz78o6J-X8SvJbBbFJIPFJEJRxe2pZfHNRR5L1B7VkHG1DbLiXCeWjPG2hr6JYBMMDo9tGkqhiOmvUbQ6KLPRNIOoUJ_DCuSR5blE4qRg-oyg7kCbEcx4ssabZ1KMjn00he3Ohr7C2unsrW7r3ej6sGlOXcPtrmZXxEs1sXEyjA)

-   Jalankan command berikut pada Eden\
    cd /var/www

Buat file dengan mkdir eden.wise.ita05.com

touch eden.wise.ita05.com/index.php

-   Lakukan restart Eden

![](https://lh6.googleusercontent.com/A2zgfY1MDVnEXORXbRjmvESCfEpeSna68Dt11Y0gJocDyULvgfnQjH2tATt-HqSHEIF90QXYlv0VCQVq8eDeASc3Ch22cHMhE1c6XMJgAyLdb_vIc_3yLMZPYpLXgwC9qJxomR0-U8FRFgDXnd8h1hjBzbOZGrvxgkU-FqKdsRb0rZzUBCYp7k1RRQ)

-   Jalankan command berikut pada Eden\
    a2ensite eden.wise.ita05.com.conf\
    service apache2 reload\
    lynx eden.wise.ita05.com

-   Hasil\
    ![](https://lh4.googleusercontent.com/UwiscaPJmw0P36Z5jyes8HYVl9cIVa2Odh_vTui0UjRVNTQ92DLON3GnFAa7tzBg5brFvewbXk-b8jDRXGj86ARzlxOD7IlP74WG_jwDPrWNTzlFmS1-Bg2V-24NvonyN41P-ZLwabra9965BFkPHs17IRDghDSbVyJtKdsr7altURygu1qBUwb3pw)

1.  Untuk folder /public digunakan untuk directory listing

1.  Edit eden.wise.ita05.com.conf pada Eden di /etc/apache2/sites-available/

![](https://lh4.googleusercontent.com/KIjWnvtVzraiDgAdwn1CkjG0Y6JfaQ22CPfPcF8YX9YQZOeg1jVp7am5mUeSmZ61HJhVzuAYBRNxakkIrwcnvIs9m2luIVaAp38A8l3qv2qL7uSj6BWGNzjrMmnNaRytofFFlb7k35w06AcNza3_rW-gbs1xzIhjXOgwAtovfHPyuagJ1vW55eVQMA)

1.  Jalankan lynx eden.wise.ita05.com/public pada SSS

![](https://lh6.googleusercontent.com/mBZ7HIa6dQIjtqOKlo4kh-dEnLv4yKL-puF_FO6_6ZDzYo1rZUOQj-bm1EmPfh-1DQtzuY7DsfrategWdBLbYhRbGh6V1Na-YiUASM9bHWlFLkJqfoRPQA6aMeTw125J4j1KacIKonJyeWwhsvjfCmLXU7ZYydO7ClDRVtlTFqzOEhz9aiPZ-CpmbA)

1.  Diminta untuk membuat error file 404.html pada folder /error untuk menggantikan error code pada apache

![](https://lh3.googleusercontent.com/mvbOZsK04GJNZ9RsddxQ5bZ2Ge_0Im23Rzvqr2ylC7w0wOG1360jFPFsMd4YVKB88pGVacxnaeUlg4hjBzCn_KeJ18SETrFM7_9pwVnlVLhsKX0OSwmUbmfxevKCYmBh9OVjDZbtADf3A10oZoHgbfSZtG0OOeXHPF9u889wFeTTdLOqzuF42tf27A)

Isi dari file 404.html

![](https://lh6.googleusercontent.com/VkmEJmzsWpAHCpU4Agsk63mpePwGGZ3hn1fuOB8fgcqRpt8P1ih1aCdK8ZAzrdAvhIdZjECmmu5gg9TrtyWMpAjwvTHTfOjUEChS9X-IfYWf7OeeexcuQgJeYd3uBsXhvg_1eaiRORbI5YiFXTnCBTYWv-VaC2xVyFQkfQxGeeglb4O1Bu5pwy_mew)

1.  Membuat konfigurasi virtual host. Konfigurasi ini digunakan untuk akses file asset www.eden.wise.its05.com/public/js menjadi [www.eden.wise.ita05.com/js](http://www.eden.wise.ita05.com/js)

-   Pengubahan alias\
    ![](https://lh4.googleusercontent.com/vAZMf2nPffkl2brK_X3VhDza0E634-J3dGO_RJDD64ljIttxzS9KiK1EArElQq8kBMkGxna6OpGVwh_T6Q00xt_itfWs2PCupHBti5kHmT1VyjeiBeMn8-13HWS4t7ZoGBZz0LhKSJZKH6lVOY-vcayxTk_wwREFwtz3ap6geXmYZQunUWMhaMWHgg)

-   Cek isi www.eden.wise.ita05.com/js

![](https://lh6.googleusercontent.com/U1gqBMwAzCBXNncuhN7iI-ZZCOnzfMoak4JOvA9Ld_wG4Z9vkNP_88uBxsYQ9ykU4QRLA-9Xy9Ckd7doljG-lOgulIdVNMch9MFWaiiOMSp0mE_XHc7KXJaF1BwGIt0jgajOk-RENwRwbftUqH4VG5738AChOstto-K0SXYSLBtv270IoHHZPagZqw)

1.  Diminta agar ww.strix.operation.wise.ita05.com hanya bisa diakses dari port 15000 dan 15500

1.  Copy file config 000-default.conf ke directory baru strix.operation.wise.ita05.com.conf

![](https://lh4.googleusercontent.com/UbOZeK2t85aQksOzl-T8Wc4zWinJEjKynkxODKpPBYHmjelFi9G-uW5nRUdToIanyLOX_Vc5vUR7BkLP2KK5V48bdwvDpEyYMUEwUJ1YSd6SrQzqJRUiBGWBt5lW92K50zZNVBDipD8yA05hyecgZIONzCbThNdnAD19WU-sZiK1-3_q4F5TnoorzA)

1.  Kemudian nano strix.operation.wise.ita05.com.conf untuk menambahkan port akses  15000 dan 15500

![](https://lh4.googleusercontent.com/2Qz3oB2NgSMB30Wd8dI-_Joy9sZv5r7xVdD2dUkiVlGeDCNHbivUIYAsW4CuYhY9mTrkpdM6tcU2VTAWintBYnG42YfvXIWLuXFVVnZBZOyZJ4kpkJc_CCXefBAscyveN0inORUGC8nHh-JmJ7jebtPdQMJJ2j9eo9xqabECoZ_WcdtoDL5VlL_yVw)

1.  Kemudian nano /etc/apache2/ports.conf untuk menambahkan port yang sama

![](https://lh5.googleusercontent.com/dUqTePwvmHrGarY0-Kc7fQu39JCaq-cdTLzxCbiRhhO_fNO3NGJpE1cVNz7vvL66u5f2qDEkSIFNGjcfRagtosfYjnN9YD9E9vZUfePJkR_OjwCM__If_Jox2Qa-DWR43IrTvQvOu25o4vwd5aJH-lTU72b7Ry6krrxNM7PI1wj9QytgVWpHAh3b4A)

1.  Kemudian buat directory html di /var/www dengan format strix.operation.wise.ita05.com  ![](https://lh5.googleusercontent.com/vG9-x-Z-e7sijvMfmtp7b02NsQnU11PXvEzJFjU0cx7otQwIw1_9z3C5llrCFjQMlQNfQlaNkrwMNqtvjVBMUYJOjc_YxsgYX67rmbloA5awpEEyLIURQSC6iLrz8ej8MxXBpBJ9Mfsaz-5TOqo7n6omaJNFuSnI28zGevPQ0tZHRrvEcijeTy9YsQ)

1.  Melakukan autentikasi username Twilight dan password opStrix dan file /var/www/strix.operation.wise.ita05

-   Set username dan password sesuai yang diinginkan soal\
    ![](https://lh6.googleusercontent.com/epJ3NPaplV5giR-GThLh6dox0-pJFBFauQGce-8O9jhxaHGZAAvzU2Gm2D0ex7mF_pCFkk4j_6N-2JE9Iw-LK3bymDi7uLmZhC5oyvpypZraNbNvwSjNF1fCZNwGCmby7sbHXKfpEOQha2t4XcFJElqQ72pX8SBQlM42pR_7XIjwY07ynEABohkjTQ)

-   Set directory untuk require permintaan username dan password\
    ![](https://lh3.googleusercontent.com/ZAqomvvUvT_sl-smW3aVvUbRmAMHvOVRX5RUYWD7QN9sKTuLtKFcO8bHVGLurpuF3uUJQ5TqS8vnLG4Bjl5ti7k1O7n1EcujlkH3TuJm4NUBf0CbAhiyyzxjFnuK5-JkrtvDAltHtYaR8StuPAJC4eQyogBFT29NYraUQ_gyUJ-RPwhKqQPrcUA_iw)

-   Tampilan setelah dilakukan set username dan password\
    ![](https://lh5.googleusercontent.com/JN6JIDUFOzfEzp_Mm2NjGUlWiCa-6biVyDExlJviZdlnIRuo7vU82kIQFaYGUkTT69JkBt1GtzXd7tF1lcL1FD_hQmUvN_eJkTqDi4wxV1Nwda-6fd8Lk-VG-bDtUuiazkc5zhQQIUksde_PP1-XOpyrDr3lzSTRyBnyblzDB7bSplInkhjG13LL6g)

-   Tampilan setelah username dan password yang diinputkan benar\
    ![](https://lh5.googleusercontent.com/iBQ-bV-pfiVoVR-EWJUM5bYLsNvW_4U1PB_wRpheTavOjQVZgSBt7zrX4weBVhvWtBLgLdC8ObAOHdhHpP9gWnT-KFM4FvCX8m7SzaJknYGzfwWux9JQghCFOnVzUyngSV9dlxFlpe1VAFqIxQ-QUdZg9_wOqIPTW9FCPEuqj9VdaJD-qdxFUc84Fg)

1.  Mengatur dimana setiap kali mengakses IP Eden akan dialihkan secara otomatis ke [www.wise.ita05.com](http://www.wise.ita05.com)

-   Cek apakah IP Eden sudah bisa berjalan

![](https://lh6.googleusercontent.com/Cjc6oYQqad_6AtrneWksIDjuk_dL0-PllxUePcO70Q0oPMgn3rVK4XSJJXSj5R1j1M80EQT0BilFbEcA6F1g244IEjIgJsPuUhRAy38zwX6O9YKudTE1KLr7SUa6dsQ0rK4lTV3rtCgP5nt9HKK1CyrPPuJQoRy8QDrcwQTkHRzuUtv6kVhHUeQpAQ)

-   Kita set redirect pada file 000-default.conf\
    ![](https://lh6.googleusercontent.com/nkY762-JdE59B8ozicD0B8LMSs3InVdGFhCXLFuZ6frJjtJS49Xz4DXh0kH5nOtykEACQnxbyT5Zn-cjjumH9FI0OKqO3QrLnU-cg5vGBBAxzl7b_ZxFzFROgGvakph3NayfKDfJypMXtK-064PLm3JuwEg7YzzuJmVyzHK39UkVyZWQiPFuCJ4Dfg)

-   Kita reload dan restart dengan menjalankan command berikut\
    service apache2 reload

service apache2 restart

-   Kita buka [www.wise.ita05.com](http://www.wise.ita05.com) apakah sesuai dengan isi dari ip Eden\
    ![](https://lh6.googleusercontent.com/hwanbntSUDdLO0IDyeia8fSWR9BR5ZD58XVFrpBxRhObifqgr477wiD1JkaplUclP0uIiZNVgIdZPBvD49Q7I0JOlIwsGYN0qC_EXkrZKhCjZrUPMO1jg1csW4u2Y61BcLzf3hcm3I0yHRbvi8oAfOlygVWitarUkDjSWI4UVrJgWrTRrJE5pgqtsg)

![](https://lh3.googleusercontent.com/Es9rsxbYT8nCtqDweyJOLW5AMI-Ec-nydSCFhp4yyW68wHt2ttLOdXS0TJLcqnXabGGvuXaDn6WSEOJ05AP7N3WMpzgpjJYMQO6cm6X3yFWTyjQJEaFsn0quRsi_4Sa2CoI66715JMrS4nzJY881n8xIW9K4r60_X38kkMn70P8blvqq0w8G4Kriyg)

1.  Request gambar yang memiliki substring eden untuk diarahkan ke eden.png

![](https://lh3.googleusercontent.com/9a0JyNP0Pl9QcPiIS4zw3_MXLxXPELBtHpQmNUMwTd6nG6tqmx53mVYOHZVYUYtIq1nSNCAkTJUKhfY-MYkhK2ULayfJEn_Z-iAdQe6iKvTfInI7K8K1TPqNpqxdD2nH98h_GCI0GxqpHX6awcQfGXo99dJc2EaqLapmPHxvOQiCrtaNx4TYXaIviw)![](https://lh6.googleusercontent.com/uDhjNM-GBmqSQ060vE-O5ppw-HGmG9GW7EX6WFxAg-vVON6PseV2WCfL-8jgTkm4Suvx4X6kIyPDu7yo8INB1bjl_DlzVZ65RnuAB3KkkxnJhlFpGq_QADQAJL5-jBXP9BYfjhbycwS96ynwb-hTeA1nOMUzbaEA00zQhz27dDzvMP69uhTxWV1Mng)![](https://lh3.googleusercontent.com/c4e8v7pLSSOIYb33R0AUJ0wFlA855cpwEBs3Ib10-6xsUSI__g6dcFIKLdQruJjsIq_0rkQQHCQi4s8tzF0_5Z5WAC2ZEqoM_aFBF3cE2iAXbvdbzgXu8f2Z0qu5sAcRbB-rbAAU4mFUmJmLIjYOEmSJ1ee4rEXcvbY7VksjQGO-3OHog0wN8vnuMQ)![](https://lh5.googleusercontent.com/7jfwCY2Ruh27vrhNkanlEPRxemH5knkBEEmjyKi6qcQA1Sl086Bp1PthDdgvgmha3Y_sgvuCS9DyKBES0gyv5ikf3V-g1op-OWtmwEotJhZnwGermzKUbNjVkfLmuuMBi1GoAi5UBijjZKevTeUIzUOuMK_KePwKRAQllMwdiU6AqXpBqGgEAsIMtg)![](https://lh6.googleusercontent.com/UD_ux4_hh8L01j87edvg03zcwvnXaad39D4e6_1PXmqcCA_aqvzqb5eG68hkwAqHptEVNmqBr5yV1C2ZA6-Od-ZUZghKdVWWUpw0H1uM0rorZKiWw2ZwBD20fP1vmq9zs-76orE3AvAqv2yFZ4kb2JlC14wKoXRxcWyOI65Imv6AoURd0pqrFZ3Yvw)
