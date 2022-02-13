library(RCurl)
library(RTidyHTML)
library(XML)
library(stringr)

#u <- "https://www.tuacasa.com.br/tipos-de-flores/" 
u <- "https://pt.wiktionary.org/wiki/Categoria:Árvore_(Português)"
doc.raw <- getURL(u, .encoding = 'UTF-8')
#doc <- tidyHTML(doc.raw)
#html <- htmlTreeParse(doc, useInternal = TRUE)
html <- htmlTreeParse(doc.raw, useInternal = TRUE, encoding = 'UTF-8')
txt <- xpathApply(html, "//body//text()[not(ancestor::script)][not(ancestor::style)][not(ancestor::noscript)]", xmlValue)
finalText <- unlist(txt)

finalTextSubset <-finalText[396:808]

#searchTerm <- paste0(1:81, ".")

myquery <- integer()

for (i in 1:length(searchTerm)) {
        
        myquery <- c(grep(searchTerm[i], finalTextSubset, fixed = TRUE), myquery)
        
}

myquery <- unique(myquery)

finalTextSubset <- finalTextSubset[myquery]


myFlowers <- str_extract(finalTextSubset,"[0-9]+.+ ")

myFlowers <- str_trim((unlist(strsplit(myFlowers, "[0-9]+[. ]+ "))))
myFlowers <- myFlowers[myFlowers != ""]
