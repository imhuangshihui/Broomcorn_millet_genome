**ALL the python scripts are written by Zhiheng WANG**

**The pipeline is edited by Shihui HUANG**


# 01 Assemblytics輸出文件預處理

**Assemblytics輸出的bed文件分類成Insertion, Deletion, Repeat Region等**

    python3 extract_assemblytics.py assemblytics.bed
    
_出現以SV結尾的deletion/insertion文件是>50bp的，以INDEL結尾的文件是<50bp的_

>lzj_kn_cg.Assemblytics_structural_variants_Deletion_SV.bed
>
>lzj_kn_cg.Assemblytics_structural_variants_Insertion_SV.bed

**因爲insertion的兩列坐標是一樣的，需要做一些轉換，才能在後續與bedtools coverage使用**

    python3 convert_Insertion.py insertion_sv.bed
    
>lzj_kn_cg.Assemblytics_structural_variants_Insertion_SV_CI.bed
    
**將每一個insertion, deletion的文件拆分成50-100bp, 100-300bp, 300-500bp and above 500bp的不同區間**

    python3 classification_SVs.py Deletion_SV.bed
    
    python3 classification_SVs.py Insertion_CI.bed
    
_二者出來的文件的文件名都是一致的，爲了避免覆蓋，在跑完Deletion后單獨創建一個文件夾存儲，再跑Insertion_

**對insertion文件進一步處理**


    
# 02 統計被SV影響的TE, CDS and Gene

**TE與SV的交集：用EDTA的輸出文件與每一個區間的SV做覆蓋分析**

    bedtools coverage -a TEanno.gff3 -b Insertion_50-100bp.bed > Inertion_50-100bp.edta
    
**CDS與SV的交集：從基因組注釋文件中提取第三列為CDS的序列作爲-a的輸入文件**

    bedtools coverage -a annotation_cds.gff3 -b Insertion_50-100bp.bed > Insertion_50-100bp.cds
    
**統計每一個區間的SV影響的基因**

    python3 sta_cds.py annotation.gff3 Insertion_50-100bp.cds
    
**統計每一個區間的SV影響的CDS**

_需要先把.cds的後綴改爲.coverage再運行這個脚本_

    python3 sta_cds_coverage.py Insertion_50-100bp.cds
    
**統計每一個區間的SV的各類轉座子長度及其比例**

_此處輸入的bed文件和edta的文件前綴要一致_

    python3 sta_EDTA_propotion.py Insertion_50-100bp.bed Insertion_50-100bp.edta
    
輸出文件第一列是轉座子類型，第二第三列分別是該類型轉座子所占的長度及其比例。因爲脚本問題會將結果打印兩次，要想繼續下一步就要刪掉多餘的部分，且不能有多餘空白行。
    
**TE比例在SV上分佈的可視化**

_在脚本末尾修改對應的文件路徑，圖片會以彈窗的形式展現，自定義保存路徑_

    python3 SV_EDTA_barplot.py
    
    
