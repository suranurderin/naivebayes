library(titanic)
library(e1071)
library(caret)

#titanik gemisindeki yolculara ait yas, cinsiyet, sinif gibi
#bilgileri ve hayatta kalma durumunu içeren "titanic_train" 
#veri setini yukluyoruz.
data("titanic_train")

#'titanic_train' veri setini olcuların hayatta kalma durumunu 
#'(Survived değişkeni) sınıflandırmak için kullanabiliriz.

#NOT: Titanik verileri için 'titanic' kutuphanesini yukluyoruz.

#veri setinin ozet istatistiklerini cikaralim
summary(titanic_train)

#veri setinin yapisini (degiskenlerin turleri ve ilk birkac gozlem) 
#cikaralim
str(titanic_train)

#veri setinin isimleri, sinifi ve satir numaralari gibi ozelliklerini
#cikaralim
attributes(titanic_train)

#titanic_train veri setindeki örnekler üzerinde modelin tahminlerini 
#yapiyoruz.
model <- naiveBayes(Survived ~ ., data = titanic_train)
print(model)

#gercek 'Survived' degerleri ile modelin tahmin ettigi 'Survived' 
#degerlerini karsilastiran karsilik matrisi olusturalim.
ongoru <- predict(model,titanic_train)
table(titanic_train$Survived,ongoru)

#Karışıklık matrisinden elde edilen doğru sınıflandırmaların 
#(diagonal elemanlar) toplamı, toplam gözlem sayısına bölünerek 
#modelin doğruluğu hesaplanır. 
karisiklikmatrisi <- table(titanic_train$Survived, ongoru)
sum(diag(karisiklikmatrisi)) / sum(karisiklikmatrisi)

#Titanik verilerinin dogrulugu %92'dir (0.92).


