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
   Порог для ENCFF932OHQ: 600  
   Порог для ENCFF684CIQ: 1500
   
5. 

