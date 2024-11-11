library(phytools)
library(RERconverge)
library(ape)
library(tidyverse)
library(dplyr)
library(dispRity)
library(topGO)


setwd("")

spidertreefile = "invasive_all_branch_length"
spidertrees = readTrees(spidertreefile, max.read = 8095)

spidernames <- c("Heteropoda_davidbowie","Heteropoda_simplex","Heteropoda_tetrica","Heteropoda_venatoria","Latrodectus_geometricus","Latrodectus_hasselti","Latrodectus_hesperus","Loxosceles_deserta","Loxosceles_reclusa","Loxosceles_rufescens","Trichonephila_antipodiana","Trichonephila_clavata","Trichonephila_clavipes","Trichonephila_inaurata","Trichonephila_plumipes")
spiderRER = getAllResiduals(spidertrees, useSpecies = spidernames, transform = "sqrt", weighted = T, scale = T, min.sp = 3)
saveRDS(spiderRER, file = "spiderRER.rds")

newspiderRER =  readRDS("spiderRER.rds")
multirers = returnRersAsTreesAll(spidertrees,spiderRER)
write.tree(multirers, file='spiderRER.nwk', tree.names=TRUE)

#generate a binary tree from a vector of foreground species using foreground2Tree
invasive.foreground = c("Heteropoda_venatoria","Latrodectus_geometricus","Latrodectus_hasselti","Loxosceles_rufescens","Trichonephila_clavata")
sisters.invasive=NULL
invasive.Fg.tree = foreground2TreeClades(invasive.foreground, sisters.invasive, spidertrees,plotTree=F)

phenvinvasive=tree2PathsClades(invasive.Fg.tree, spidertrees)

corinvasive=correlateWithBinaryPhenotype(spiderRER, phenvinvasive, min.sp=3, min.pos=2,weighted="auto")

head(corinvasive[order(corinvasive$P),])
write.csv((corinvasive[order(corinvasive$P),]), file = "RER_spider.csv")

plotRers(spiderRER,"OG0007102",phenvinvasive)