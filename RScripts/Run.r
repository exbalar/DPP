print ("*************Welcome to Defect Prediction Tool!!**********")
sink("D:\\hackathon\\DPP\\RScripts\\out.txt")
#output <- system("cmd.exe /c rmdir /s /q D:\\hackathon\\DPP\\RScripts\\myApp ", intern=TRUE)
#output <- system("cmd.exe /c git clone https://github.com/exbalar/myApp.git", intern=TRUE)
output <- system("cmd.exe /c D:")
output <- system("cmd.exe /c cd D:\\hackathon\\DPP\\RScripts\\myApp\\ && git.exe pull", intern=TRUE)
output <- system("cmd.exe /c cd D:\\hackathon\\DPP\\RScripts\\myApp\\ && git.exe log --pretty=oneline", intern=TRUE)
#cat(readLines("D:\\hackathon\\DPP\\RScripts\\out.txt"), sep="\n")

output <- substr(output,0,40)
commitId <- strsplit(output, "\n")[[1]]
#print(commitId)
#numberOflines <- system("wc -l out.txt")
#commitId <- system("head -n 1 output")
#print(commitId)
#print(nchar(commitId))
output <- system(sprintf('cmd.exe /c cd D:\\hackathon\\DPP\\RScripts\\myApp && git.exe show --name-only --pretty="" -r %s', commitId), intern=TRUE)
#print(output)
files <- strsplit(output, "\n")
#print(files)
#print("length::")
#print(length(files))
sizeOfFileList <- length(files)
#print(files[[1]])
#print(files[[2]])


featureandTRList <- c()
arr <- array(1)
outList=NULL 
x <- 0
for (i in 1:sizeOfFileList) {

	#print(i)
	reccommitLine <- system(sprintf('cmd.exe /c cd D:\\hackathon\\DPT\\myApp\\ &&  git log --pretty=oneline  %s', files[[i]]), intern=TRUE)
	#print("commitLine")
	#print(reccommitLine)
	
	post2 <- regexpr("\\]",reccommitLine)
	post1 <- regexpr("\\[",reccommitLine)
	#print("position:")
	#print(post1)
	#print(post2)
	recCommitId <- substr(reccommitLine,post1+1,post2-1)
	#print(recCommitId)
	
	splittedCommitId <- strsplit(recCommitId, " ")
	for (j in 1:length(splittedCommitId)){
	#print(splittedCommitId[[j]])
		#if(splittedCommitId[[j]] != "" && splittedCommitId[[j]] != " ") {
		
			arr[0] = splittedCommitId[[j]]
			#x <- x+1
		#}
	}
}

print(arr)
