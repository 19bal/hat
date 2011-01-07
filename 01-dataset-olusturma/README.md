burada 

0. @husta: elindeki db yi nasıl temin ettin -> EMGlab, link ekle

1. veri dosyalarını (`N2001A01AP51.csv |.hea | .bin`) içeren sıkıştırılmış dosyayı download kısmından [indir](https://github.com/downloads/19bal/svm/EMGlab.tar.gz)

2. bu dizindeki `_db/orj/` klasörüne aç. Dizin yapısı şöyle olmalı,

	a/_db/orj/
	         |-> N2001A01AP51.csv
	         |-> N2001A01AP51.hea
	         \-> N2001A01AP51.bin

3. matlab'la `csv` dosyayı aç ve çizdir

4. `csv2mat`: ``*.csv` dosyasını `*.mat` olarak `_db/mat/` klasörüne kaydet

5. `.hea` içeriğini göster

