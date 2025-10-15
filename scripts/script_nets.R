# REDES

getwd()
setwd("C:/Users/cap_a/OneDrive/Documentos/Doutorado/Capitulo_1/Scripts")
setwd("G:/Users/cap_a/OneDrive/Documentos/Doutorado/Capitulo_1/Capitulo_1/Scripts")
source("Ordernet.R")
setwd("G:/Users/cap_a/OneDrive/Documentos/Doutorado/Capitulo_1/Capitulo_1/Defaunation/Data")

baseline <- read.csv("ESs_baseline.csv", sep = ";")
defaunada_baixo <- read.csv("ESs_defaunada_baixo.csv", sep = ";")
defaunada_medio <- read.csv("ESs_defaunada_medio.csv", sep = ";")
defaunada_ruim <- read.csv("ESs_defaunada_ruim.csv", sep = ";")
defaunada_worst <- read.csv("ESs_defaunada_worst.csv", sep = ";")

head(defaunada)

baseline_mean<-as.data.frame(aggregate(.~ecoregion, baseline, mean))
defaunada_baixo_mean<-as.data.frame(aggregate(.~ecoregion, defaunada_baixo, mean))
defaunada_medio_mean<-as.data.frame(aggregate(.~ecoregion, defaunada_medio, mean))
defaunada_ruim_mean<-as.data.frame(aggregate(.~ecoregion, defaunada_ruim, mean))
defaunada_worst_mean<-as.data.frame(aggregate(.~ecoregion, defaunada_worst, mean))

head(baseline_mean)

baseline_mean=baseline_mean[,-2]
defaunada_baixo_mean=defaunada_baixo_mean[,-2]
defaunada_medio_mean=defaunada_medio_mean[,-2]
defaunada_ruim_mean=defaunada_ruim_mean[,-2]
defaunada_worst_mean=defaunada_worst_mean[,-2]

head(defaunada_ruim_mean)

perdida_baixo=as.data.frame((defaunada_baixo_mean[,-1]-baseline_mean[,-1])/baseline_mean[,-1])
head(perdida_baixo)


#baseline <- aggregate(baseline[,2:39], by = list(baseline$Genera), FUN = sum) # SÓ SE FOR POR GÊNERO


rownames(baseline_mean)<-baseline_mean[,1:1]
mm<-baseline_mean[,-1] # CHANGE HERE
mat = mm
head(mat)
mat = mat[rowSums(mat)!=0, ] 
mat = mat[,colSums(mat)!=0 ]
m=dim(mat)[1] 
n=dim(mat)[2] 
rmarg=apply(mat,1,sum)
cmarg=apply(mat,2,sum)

head(mat)


#----------------------------------------------------------------------------------------------------------------------------------------------------------------------#



# BIPARTITE PLOT


mat=order.net(mat)
es<-colnames(mat)
library(viridis)
y=viridis(ncol(mat))
es<-colnames(mat)



par(mar=c(1,1,1,1))
library(bipartite)
plotweb(mat,method = "normal",arrow="up.center",
        col.high = y, 
        col.low = c("#2983ea","#22d697","#c55b8d","#7635e5","#278426","#d64d48",
                    "#8833e9","#26a2e5","#042ae7","#a6f6e7","#9b42be","#b0941a",
                    "#73ff00","#73ffc9","#e268ef","#ff8c09","#678ccb","#01f7ff",
                    "#ead728"),
        col.interaction= y,
        bor.col.interaction =y, 
        bor.col.high=y,
        labsize = 0.7,
        bor.col.low="black",
        high.lablength = NULL, low.lablength = NULL, 
        text.rot=90,
        text.high.col="black", text.low.col="black",
        low.lab.dis=0, abuns.type='additional')

#low
par(mar=c(1,1,1,1))
plotweb(mat,method = "normal",arrow="up.center",
        col.high = y, 
        col.low = c("#2983ea","#22d697","#c55b8d","#7635e5","#278426","#d64d48",
                    "#8833e9","#26a2e5","#042ae7","#b0941a","#a6f6e7","#9b42be",
                    "#73ff00","#73ffc9","#e268ef","#ff8c09","#678ccb","#01f7ff",
                    "#ead728"),
        col.interaction= y,
        bor.col.interaction =y, 
        bor.col.high=y,
        labsize = 0.7,
        bor.col.low="black",
        high.lablength = NULL, low.lablength = NULL, 
        text.rot=90,
        text.high.col="black", text.low.col="black",
        low.lab.dis=0, abuns.type='additional')

#medium
par(mar=c(1,1,1,1))
plotweb(mat,method = "normal",arrow="up.center",
        col.high = y, 
        col.low = c("#2983ea","#22d697","#c55b8d","#7635e5","#278426","#d64d48",
                    "#8833e9","#26a2e5","#a6f6e7","#b0941a","#042ae7","#73ff00",
                    "#9b42be","#73ffc9","#ff8c09","#e268ef","#01f7ff","#678ccb",
                    "#ead728"),
        col.interaction= y,
        bor.col.interaction =y, 
        bor.col.high=y,
        labsize = 0.7,
        bor.col.low="black",
        high.lablength = NULL, low.lablength = NULL, 
        text.rot=90,
        text.high.col="black", text.low.col="black",
        low.lab.dis=0, abuns.type='additional')

#high
par(mar=c(1,1,1,1))
plotweb(mat,method = "normal",arrow="up.center",
        col.high = y, 
        col.low = c("#2983ea","#22d697","#c55b8d","#7635e5","#278426","#d64d48",
                    "#8833e9","#26a2e5","#b0941a","#042ae7","#73ff00","#9b42be",
                    "#678ccb","#73ffc9","#a6f6e7","#ff8c09","#e268ef","#01f7ff",
                    "#ead728"),
        col.interaction= y,
        bor.col.interaction =y, 
        bor.col.high=y,
        labsize = 0.7,
        bor.col.low="black",
        high.lablength = NULL, low.lablength = NULL, 
        text.rot=90,
        text.high.col="black", text.low.col="black",
        low.lab.dis=0, abuns.type='additional')


#worst

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------#




# METRICAS DAS REDES


# GRAU E GRAU MÉDIO


dadosredes<-mat
K.ap1.An=apply(dadosredes,1,sum) #Exemplo de como calcular o grau dos dung(linhas)
K.ap1.An<-as.data.frame(K.ap1.An)
K.ap1.An
K.ap1.Pl=apply(dadosredes,2,sum) #Exemplo de como calcular o grau dos mamíferos (colunas)
K.ap1.Pl<-as.data.frame(K.ap1.Pl)
K.ap1.Pl
KMed.ap1.An=mean(apply(dadosredes,1,sum)) #Calculo do grau medio de dung
KMed.ap1.Pl=mean(apply(dadosredes,2,sum)) #Calculo do grau medio de mama
KMed.ap1.An
KMed.ap1.Pl


#----------------------------------------------------------------------------------------------------------------------------------------------------------------------#



# CONECTÂNCIA

dadosredes<-mat
mm.bin=matrix(0,dim(dadosredes)[1],dim(dadosredes)[2]) 
mm.bin[(which(dadosredes>=0.001))]=1
K.ap1=apply(mm.bin,2,sum) 				#grau das colunas
E.ap1=apply(as.matrix(K.ap1), 2, sum)	      #numero de arestas (interacoes) na rede
R.ap1=dim(mm.bin)[1]					#numero de linhas
C.ap1=L=dim(mm.bin)[2]					#numero de colunas
Conec.ap1=E.ap1/(R.ap1*C.ap1) 			#calculo da conectancia
Conec.ap1


#----------------------------------------------------------------------------------------------------------------------------------------------------------------------#



# MODULARIDADE - conexao entre grupos


# QUANTITATIVA (DADOS REAIS)

modularidade.R<-computeModules(dadosredes, deep = FALSE, deleteOriginalFiles = TRUE,
                               steps = 1000, tolerance = 1e-30, experimental = FALSE) 
modularidade.R@likelihood

# plotModuleWeb(modularidade.R)

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------#


# ANINHAMENTO


mm.bin=matrix(0,dim(dadosredes)[1],dim(dadosredes)[2]) 
mm.bin[(which(dadosredes>=0.001))]=1
require(bipartite)
pp1.NODF=nested(mm.bin, method = "NODF2")
pp1.NODF



# SÍNTESE


KMed.ap1.An
KMed.ap1.Pl
Conec.ap1
modularidade.R@likelihood
pp1.NODF



#----------------------------------------------------------------------------------------------------------------------------------------------------------------------#


# MODELOS NULOS PARA MODULARIDADE


# QUANTITATIVA (NULL MODELS)


nrow(dadosredes)
summary(dadosredes)
#medianas<-c(median(dadosredes[,1:1]),median(dadosredes[,2:2]),median(dadosredes[,3:3]),median(dadosredes[,4:4]))
maxi=KMed.ap1.An # DEFINIR VALOR MÁXIMO PARA INTERAÇÃO NOS MODELOS NULOS
i=1
N=11
nsave=1
while (i <= N) {
  x<-matrix()
  for (i in i:N){
    null=replicate(ncol(dadosredes), runif(nrow(dadosredes), 
                                           min=min(dadosredes), max=maxi))
    modularidade<-computeModules(null, deep = FALSE, deleteOriginalFiles = TRUE,
                                 steps = 1000, tolerance = 1e-30, experimental = FALSE)
    i=i+nsave
    x[i]<-modularidade@likelihood
  }
}
x
mean(x)
#par(mar=c(4,4,4,4))
#hist(x,xlim=c(0,0.5),ylim=c(0,200),xlab="Modularity")
#abline(v=modularidade.R@likelihood,col="red")



# SIGNIFICÂNCIA



mean(x,na.rm=T)
sum(x >= modularidade.R@likelihood,na.rm=T)
pvalor=sum(x >= modularidade.R@likelihood,na.rm=T)/N
pvalor



#----------------------------------------------------------------------------------------------------------------------------------------------------------------------#

# MODELOS NULOS PARA ANINHAMENTO


# BINÁRIA (NULL MODELS)

m=dim(mm.bin)[1] 
n=dim(mm.bin)[2]	
rmarg=apply(mm.bin,1,sum)
cmarg=apply(mm.bin,2,sum)
N<-1000 # NÚMERO DE MODELOS NULOS
mat<-mm.bin

prob=matrix(0,m,n)
for (i in 1:m){
  for (j in 1:n){
    prob[i,j]=((rmarg[i]/n)+(cmarg[j]/m))/2 
  }
}
R=N
mat.t=array(0,c(m,n,R)) 
s=1

while (s<=R){ 
  
  rand=matrix(runif(m*n),m,n) 
  aux=mat.t[,,s] 
  aux[which(rand<prob)]=1
  rm.aux=apply(aux,1,sum)
  cols=sample(1:n,sum(rm.aux==0), replace=TRUE) 
  for (i in 1:sum(rm.aux==0)){
    aux[which(rm.aux==0)[i],cols[i]]=1 
  }
  cm.aux=apply(aux,2,sum)
  
  rows=sample(1:m,sum(cm.aux==0), replace=TRUE) 
  for (i in 1:sum(cm.aux==0)){
    aux[rows[i],which(cm.aux==0)[i]]=1
  }
  if (sum(aux)==sum(mat)){ 
    mat.t[,,s]=aux	
    s=s+1
    
    
    
    f <- function(m) t(m)[,nrow(m):1]
    image(f(aux), col=rev(c("black","white")), xaxt="n", yaxt="n")
    
  }
}	

# for(i in 1:R){
# name=paste(deparse(substitute(mat)),i,".txt", sep="_")
# write.table(mat.t[,,i],file=name,row.names=F, col.names=F, append=T, quote=F) 	
#}


# SIGNIFICÂNCIA


null.NODF=apply(mat.t,3,nested,method="NODF2")
null.NODF
mean(null.NODF)
sum(null.NODF>=pp1.NODF)
pvalor=sum(null.NODF>=pp1.NODF)/R
pvalor
par(mar=c(2,2,2,2))
x11()
hist(null.NODF, col="white", xlim=c(0,100),ylim=c(0,500),xlab="NODF")
abline(v=pp1.NODF, col="red", lwd=1)
text(x=80,y=2,pvalor)





#----------------------------------------------------------------------------------------------------------------------------------------------------------------------#
