setwd(paste0(getwd(), "/Desktop/GilVicente"))

library(pdfsearch)
myFiles <- c("/livros/um.pdf", "/livros/dois.pdf", "/livros/tres.pdf")
filesLoc <- paste0(getwd(), file)

# WORKING
# result <- keyword_search(filesLoc[1],
#                          keyword = c('grão'),
#                          path = TRUE)



### PDF TOOLS TO SPLIT PDFs

library(pdftools)

tomoI <- read.xlsx("lista.xlsx", "tomoI")

for (i in 1:nrow(tomoI)) {
      
        pdf_subset(filesLoc[1], pages = tomoI$inicio[i]:tomoI$fim[i], 
                   output = paste0(getwd(), "/livros/tomo_1/", tomoI$obra[i], ".pdf"))  
        
}

tomoII <- read.xlsx("lista.xlsx", "tomoII")

for (i in 1:nrow(tomoII)) {
        
        pdf_subset(filesLoc[2], pages = tomoII$inicio[i]:tomoII$fim[i], 
                   output = paste0(getwd(), "/livros/tomo_2/", tomoII$obra[i], ".pdf"))  
        
}

tomoIII <- read.xlsx("lista.xlsx", "tomoIII")

for (i in 1:nrow(tomoIII)) {
        
        pdf_subset(filesLoc[3], pages = tomoIII$inicio[i]:tomoIII$fim[i], 
                   output = paste0(getwd(), "/livros/tomo_3/", tomoIII$obra[i], ".pdf"))  
        
}


