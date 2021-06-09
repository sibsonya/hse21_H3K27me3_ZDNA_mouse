# hse21_H3K27me3_ZDNA_mouse

## Проект по биоинформатике
**Цель**: поиск и изучение участков генома, где определенная гистоновая метка присутствует в местах образования одной из вторичных структур ДНК (ZDNA или квадруплекс G4).

Для выполнения данного проекта были выбраны:

Организм: мышь (mm10)

Гистоновая метка: H3K27me3

Вторичная структура ДНК: ZDNA (ZDNA_mouse_1)

Тип клеток: MEL 

Также были выбраны 2 ChIP-seq эксперимента:
1. [ENCFF932OHQ](https://www.encodeproject.org/files/ENCFF932OHQ/) 
2. [ENCFF684CIQ](https://www.encodeproject.org/files/ENCFF684CIQ/)

### Выполненные команды

1. Скачивание файлов экспериментов

   wget <https://www.encodeproject.org/files/ENCFF932OHQ/@@download/ENCFF932OHQ.bed.gz>  
   wget <https://www.encodeproject.org/files/ENCFF684CIQ/@@download/ENCFF684CIQ.bed.gz>

2. Необходимо оставить только 5 столбцов файлов, скачанных выше

   zcat ENCFF932OHQ.bed.gz | cut -f1-5 > H3K27me3_MEL.ENCFF932OHQ.mm10.bed  
   zcat ENCFF684CIQ.bed.gz | cut -f1-5 > H3K27me3_MEL.ENCFF684CIQ.mm10.bed
   
3. Построение гистограмм длин участков для каждого эксперимента

   см. len_hist.R в папке src

4. Фильтрация ChIP-seq пиков (выкидываем слишком длинные пики - outliers)
   
   см. filter_peaks.R в папке src  
   порог для ENCFF932OHQ: 600  
   порог для ENCFF684CIQ: 1500
   
5. Расположение пиков гистоновой метки относительно аннотированных генов
   
   см. chip_seeker.R в папке src 
   
6. Объединение отфильтрованных ChIP-seq пиков
   
   cat \*.filtered.bed | sort -k1,1 -k2,2n | bedtools merge > H3K27me3_MEL.merge.mm10.bed 
   
7. Скачивание файла со вторичной структурой ДНК (ZDNA_mouse_1)

   wget <https://drive.google.com/u/0/uc?id=1gFY4Ma9OWFJBWVhgdV3TqTf8pgy_ghKy&export=download>

8. Pаспределение длин участков ZDNA_mouse_1 и расположение участков ZDNA_mouse_1 относительно аннотированных генов

   см. len_hist.R и chip_seeker.R в папке src
   
9. Пересечение гистоновой метки (H3K27me3) и вторичной структуры ДНК (ZDNA_mouse_1)

   bedtools intersect -a mouseZ-DNA1.bed -b H3K27me3_MEL.merge.mm10.bed > H3K27me3_MEL.intersect_with_mouseZ-DNA1.bed


   
   

