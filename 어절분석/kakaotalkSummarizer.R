# import wordcloud
library(wordcloud);
# read texts from files
files.list = list.files()
TEXT=vector()
for(i in files.list){
	text = scan(file=paste("./",i,sep=""), encoding="UTF-8",sep="\n",what=character(),quote=NULL)
	TEXT = c(TEXT,text)
}
member=unique(grep("^\\[.*\\].*" ,TEXT,value=T))
member=unique(unlist(strsplit(member, " \\[.. .+:..\\] .*")))
member = member[c(member!="[FILE]")]
txtname = gsub("^\\[.+\\] ","",sample(TEXT,1))
txtname = gsub(" ","",txtname)
TEXT=gsub("\\(","",TEXT);TEXT=gsub(")","",TEXT);
TEXT=gsub("/","",TEXT)
corpus=grep("^\\[.*",TEXT,value=T)
corpus=gsub(" \\[.. .+:..\\]","",corpus)
dir.create(paste("./",txtname,sep=""));
setwd(paste("./",txtname,sep=""))

for (m in 1:length(member)){
  name = paste(paste("\\",member[m],sep=""),"\\",sep="")
  temp = corpus[startsWith(corpus,member[m])]
  temp = gsub(paste(name," ",sep=""),"",temp)
  
  temp = unlist(strsplit(temp, " "))
  tb = sort(table(temp),decreasing=T)
  df = data.frame(tb)
  df = data.frame(row.names=df$temp, Freq=df$Freq)
  
  write.table(df, file=paste(member[m],".txt",sep=""), sep="\t", col.names=NA, quote=FALSE)
  filename = paste("./",paste(m,".png",sep=""),sep="")
  
  png(filename)
  wordcloud(rownames(df), df$Freq, scale=c(3,0.8), min.freq=2, max.words=90, random.order=F, rot.per=0, colors=brewer.pal(8,"Dark2"))
  dev.off()
  }
  setwd("..") # reset the working directory
