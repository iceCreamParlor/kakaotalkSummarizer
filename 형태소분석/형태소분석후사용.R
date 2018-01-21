library(wordcloud)
TEXT = scan(file="heejae.txt.tag", quote=NULL, what=character())
TEXT = TEXT[seq(2,length(TEXT),by=2)]
corpus = unlist(strsplit(TEXT, "[+]"))
corpus2 = corpus[nchar(corpus)>8]
corpus3 = grep("^[°¡-ÆR][°¡-ÆR]+",corpus2,value=T)
table = sort(table(corpus3),decreasing=T)
df = data.frame(table)
df = data.frame(row.names=df$corpus3, Freq=df$Freq)
write.table(df,file = "heejae.dataframe.txt",sep="\t")
png("heejae.png")
wordcloud(rownames(df), df$Freq, scale=c(3,0.8), min.freq=2, max.words=90, random.order=F, rot.per=0, colors=brewer.pal(8,"Dark2"))
dev.off()

TEXT = scan(file="eunchang.txt.tag", quote=NULL, what=character())
TEXT = TEXT[seq(2,length(TEXT),by=2)]
corpus = unlist(strsplit(TEXT, "[+]"))
corpus2 = corpus[nchar(corpus)>8]
corpus3 = grep("^[°¡-ÆR][°¡-ÆR]+",corpus2,value=T)
table = sort(table(corpus3),decreasing=T)
df = data.frame(table)
df = data.frame(row.names=df$corpus3, Freq=df$Freq)
write.table(df,file = "eunchang.dataframe.txt",sep="\t")
png("eunchang.png")
wordcloud(rownames(df), df$Freq, scale=c(3,0.8), min.freq=2, max.words=90, random.order=F, rot.per=0, colors=brewer.pal(8,"Dark2"))
dev.off()

TEXT = scan(file="seokjoon.txt.tag", quote=NULL, what=character())
TEXT = TEXT[seq(2,length(TEXT),by=2)]
corpus = unlist(strsplit(TEXT, "[+]"))
corpus2 = corpus[nchar(corpus)>8]
corpus3 = grep("^[°¡-ÆR][°¡-ÆR]+",corpus2,value=T)
table = sort(table(corpus3),decreasing=T)
df = data.frame(table)
df = data.frame(row.names=df$corpus3, Freq=df$Freq)
write.table(df,file = "seokjoon.dataframe.txt",sep="\t")
png("seokjoon.png")
wordcloud(rownames(df), df$Freq, scale=c(3,0.8), min.freq=2, max.words=90, random.order=F, rot.per=0, colors=brewer.pal(8,"Dark2"))
dev.off()

TEXT = scan(file="minsoo.txt.tag", quote=NULL, what=character())
TEXT = TEXT[seq(2,length(TEXT),by=2)]
corpus = unlist(strsplit(TEXT, "[+]"))
corpus2 = corpus[nchar(corpus)>8]
corpus3 = grep("^[°¡-ÆR][°¡-ÆR]+",corpus2,value=T)
table = sort(table(corpus3),decreasing=T)
df = data.frame(table)
df = data.frame(row.names=df$corpus3, Freq=df$Freq)
write.table(df,file = "minsoo.dataframe.txt",sep="\t")
png("minsoo.png")
wordcloud(rownames(df), df$Freq, scale=c(3,0.8), min.freq=2, max.words=90, random.order=F, rot.per=0, colors=brewer.pal(8,"Dark2"))
dev.off()