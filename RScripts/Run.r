print ("*************Welcome to Defect Prediction Tool!!**********")

system("rm -rf myApp")
#sink("/D/hackathon/DPP/RScripts/out.txt")
sink("D:\\hackathon\\DPP\\RScripts\\out.txt")
output <- system("git clone https://github.com/exbalar/myApp.git", intern=TRUE, ignore.stdout=TRUE,show.output.on.console = TRUE)

print(output)
