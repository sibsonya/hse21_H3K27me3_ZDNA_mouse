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

### Kоманды, выполненные в командной строке

1. Скачивание файлов экспериментов

   wget <https://www.encodeproject.org/files/ENCFF932OHQ/@@download/ENCFF932OHQ.bed.gz> \\
   wget <https://www.encodeproject.org/files/ENCFF684CIQ/@@download/ENCFF684CIQ.bed.gz>

2. zcat ENCFF832EOL.bed.gz  |  cut -f1-5 > H3K4me3_A549.ENCFF832EOL.hg38.bed

