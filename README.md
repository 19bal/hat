emg+svm


Binary;

Download yaptığınız source klasorunu aşamalı olarak; şu şekil de açtığınız zaman programımızı işlevini göreceğiz:

1.adım; Matlabımıza tum source kodlarını atıyoruz.
2.adım; emg_Dataset.m uzantılı dosyamızı açarak,çalıştırıyoruz,
3.adım; emg_train.m uzantılı dosyamızı açrak,çalıştıyoruz,(Eğitim aşaması;)
4.adım; emg_test.m uzantılı dosyamızı açarak,çalıştırıyoruz(Eğitim aşamasındaki sonuçlarda error:0 dır...Test aşamasındada bu sonuçlarda error:(Hatamız) :0 olarak çalışması lazım..)
5.adım; emg_test_sim.m uzantılı dosyaımızı açarak;Açık,kapalı bilgisinin similüsyon görüntüsünü görebiliyoruz...

Eğer;bu aşamaları yaptıktan sonra herhangi bir hatayla karşılaşıyorsanız,kullandığınız matlab versiyonunun strptool path ile uyuşmaazlığı vardır.Versiyona uygun strptool yüklenirse;sorun çözülmüş olucaktır...