print ("*************Welcome to Defect Prediction Tool!!**********")
sink("D:\\HACKATHON\\DPP\\RScripts\\out.txt")
#output <- system("cmd.exe /c rmdir /s /q D:\\HACKATHON\\DPP\\RScripts\\myApp ", intern=TRUE)
#output <- system("cmd.exe /c git clone https://github.com/exbalar/myApp.git", intern=TRUE)
output <- system("cmd.exe /c D:")
output <- system("cmd.exe /c cd D:\\HACKATHON\\DPP\\RScripts\\myApp\\ && git.exe pull", intern=TRUE)
output <- system("cmd.exe /c cd D:\\HACKATHON\\DPP\\RScripts\\myApp\\ && git.exe log --pretty=oneline", intern=TRUE)

output <- substr(output,0,40)
commitId <- strsplit(output, "\n")[[1]]
#print(commitId)
#numberOflines <- system("wc -l out.txt")
#commitId <- system("head -n 1 output")

output <- system(sprintf('cmd.exe /c cd D:\\HACKATHON\\DPP\\RScripts\\myApp && git.exe show --name-only --pretty="" -r %s', commitId), intern=TRUE)
files <- strsplit(output, "\n")

sizeOfFileList <- length(files)


featureandTRList <- c()
arr <- array(1)
outList=NULL 
x <- 0
tmp = character(0)

for (i in 1:sizeOfFileList) {

	reccommitLine <- system(sprintf('cmd.exe /c cd D:\\HACKATHON\\DPP\\RScripts\\myApp\\ &&  git log --pretty=oneline  %s', files[[i]]), intern=TRUE)

	
	post2 <- regexpr("\\]",reccommitLine)
	post1 <- regexpr("\\[",reccommitLine)

	recCommitId <- substr(reccommitLine,post1+1,post2-1)

	splittedCommitId <- unique(strsplit(recCommitId, " "))
	
 
	datalist<-c(splittedCommitId, length(splittedCommitId))
	for (j in 1:length(splittedCommitId)){

		if(length(splittedCommitId[[j]])!=0 ||  identical(splittedCommitId[[j]] , character(0))!= TRUE )
		{
		tmp =cbind(tmp, splittedCommitId[[j]])

		}
			
	}
}

withcomma <- gsub(",", " ", tmp)
	datalist2<-c(withcomma)
    datalist<- unique(datalist2)
	
for(k in 1:length(datalist))
{
	print(datalist[[k]])
} 