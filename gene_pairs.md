Output from **CoGe** --> **Quota Alignment Results**

![图片](https://user-images.githubusercontent.com/76728625/159845390-a6cf1a20-b3a3-4e65-a6ba-79ebe516ecb5.png)

过滤“#”开头的行并计数

    cat phv2.1_apk_gene_pairs | awk '{if($1!~"^#"){print $0}}' | wc -l
