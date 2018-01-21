# import wordcloud
#library(wordcloud);
# read texts from files
files.list = list.files()
TEXT=vector()
for(i in files.list){
	text = scan(file=paste("./",i,sep=""), encoding="UTF-8",sep="\n",what=character(),quote=NULL)
	TEXT = c(TEXT,text)
}
member=unique(grep("^\\[.*\\].*" ,TEXT,value=T))
member=unique(unlist(strsplit(member, " \\[.+:..\\] .*")))
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
	temp = gsub("\\[.*\\]","",temp)
	temp = gsub("\\n","",temp)
	temp = temp[nchar(temp)>1]
  cat(temp, file=paste(member[m],".txt",sep=""),sep="\n")
  #tb = sort(table(temp),decreasing=T)
  #df = data.frame(tb)
  #df = data.frame(row.names=df$temp, Freq=df$Freq)
  }
  #setwd("..") # reset the working directory
