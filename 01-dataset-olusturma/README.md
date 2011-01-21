burada

0. @husta: elindeki db yi nasıl temin ettin ->

   emglab arayüz programı(Matlab kodlarıyla yazılmıştır):
   aş.linkten EMGLAB v 1.03   (download) yazılımı inirilir.

   http://www.emglab.net/emglab/Software/Software.php

   Emg kas hastalıklarını içeren Gerçek ve sentetik veriler aş linkten indirilir:

   http://www.emglab.net/emglab/Signals/signals.php

   Sentetik veriler: "Synthetic signals" başlığında yer almaktadır.
   Gerçek veriler  : "Databases"         başlığında yer almaktadır.
   Herbir veri ziplenmiştir.



1. veri dosyalarını (`N2001A01AP51.csv |.hea | .bin`) içeren sıkıştırılmış dosyayı download
 kısmından [indir](https://github.com/downloads/19bal/hat/EMGlab.tar.gz)
 .bin uzantılı dosyaların herbirini .csv uzantılı getirmek için şu yol izlenir.

  Verileri ekranda görüntüleme:

  Arayüz programı: emglab.m çalıştır.

  Arayüzde file->loadEMGfile->açılan pencerede .bin uzantılı veri dosyasını seç
  Böylece .csv uzantılı dosyaların oluşmasını sağlamış olduk.

2. bu dizindeki `_db/orj/` klasörüne aç. Dizin yapısı şöyle olmalı,

	a/_db/orj/
	         |-> N2001A01AP51.csv
	         |-> N2001A01AP51.hea
	         \-> N2001A01AP51.bin

3. `runme.m`: matlab'la `csv` dosyayı aç ve çizdir

4. `csv2mat`: ``*.csv` dosyasını genlik değerleri `data.X` ve zaman değerleri `data.t` formunda şekillendirerek `*.mat` olarak `_db/mat/` klasörüne kaydet

5. `.hea` içeriğini göster

