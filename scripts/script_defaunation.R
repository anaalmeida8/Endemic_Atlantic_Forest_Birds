# -------------------------------------------------------------
# Defaunation - Chapter 3
# 28 jun 2023
# Ana Claudia de Almeida / Juliano Bogoni
# -------------------------------------------------------------

gc()


# Function defaunar at random --------------------------------------

defaunar <- function(data,percent_defaunacao){
  percent=100-percent_defaunacao
  total<-sum(data)
  uns<-as.data.frame(round(((sum(data)*percent)/100),digits=0))
  colnames(uns)<-"rest"
  zeros<-total-uns
  x<-c(rep(0,zeros),rep(1,uns))
  result<-matrix(0,nrow(data),ncol(data))
  colnames(result)<-colnames(data)
  for (i in 1:nrow(data)){
    for(j in 1:ncol(data)){
      result[i,j]=ifelse(data[i,j] > 0,sample(x),0)
    }
  }
  return(result)
}

# DEFAUNAR POR CLASSE DE AMEACA

setwd("C:/Users/cap_a/OneDrive/Documentos/Doutorado/Capitulo_1/Defaunation/Data")

baseline = read.csv("pres_abs.csv",h=T,row.names=1,sep=";")
head(baseline)

CT_ori = baseline[,1:11]
ncol(CT_ori)

EN_ori = baseline[,12:33]
ncol(EN_ori)

VU_ori = baseline[,34:65]
ncol(VU_ori)

# defaunada_CT = defaunar(CT_ori,85)
# sum(defaunada_CT)/sum(CT_ori) #0.1488475

# defaunada_CT = defaunar(CT_ori,90)
# sum(defaunada_CT)/sum(CT_ori) #0.09719522

defaunada_CT = defaunar(CT_ori,50)
sum(defaunada_CT)/sum(CT_ori) #0.5023605

# defaunada_EN = defaunar(EN_ori,50)
# sum(defaunada_EN)/sum(EN_ori) #0.507102

# defaunada_EN = defaunar(EN_ori,70)
# sum(defaunada_EN)/sum(EN_ori) #0.2977551

defaunada_EN = defaunar(EN_ori,20)
sum(defaunada_EN)/sum(EN_ori) #0.8014286

# defaunada_VU=defaunar(VU_ori,30)
# sum(defaunada_VU)/sum(VU_ori) #0.6975907

# defaunada_VU=defaunar(VU_ori,50)
# sum(defaunada_VU)/sum(VU_ori) #0.5023018

defaunada_VU=defaunar(VU_ori,10)
sum(defaunada_VU)/sum(VU_ori) #0.899119


# FUNDIR OS PEDAÇOS


defaunada=as.data.frame(cbind(defaunada_CT,defaunada_EN,defaunada_VU))
sum(defaunada)/sum(baseline) # DEFAUNAÇÃO TOTAL = 58.03% medio - 100 = 41.97%
# 39.59% no ruim - 100 = 60.41%
# 82.86% no leve (IUCN) - 100 = 17.14%
# worst: 31.28% - 100 = 68.71%

# REOGANIZAR AMBAS POR ORDEM ALFABETICA

baseline=baseline[,order(names(baseline))]
defaunada=defaunada[,order(names(defaunada))]
names(baseline)
names(defaunada)

baseline = read.csv("baseline.csv",h=T,row.names=1,sep=";")
defaunada = read.csv("defaunada_ruim.csv",h=T,row.names=1,sep=";")


# INPUTAR OS SERVIÇOS NAS MATRIZES BASELINE E DEFAUNADA (MATRICIAL)

se=read.csv("eco_services.csv",h=T,row.names=1,sep=";")
cm<-defaunada # MUDAR O NOME DA PLANILHA (baseline ou defaunada) AQUI!!!
cm<-t(cm)
# se<-t(se)
list<-as.data.frame(colnames(se))
ncolse<-ncol(se)
head(se)
setwd("C:/Users/cap_a/OneDrive/Documentos/Doutorado/Capitulo_1/Defaunation/Data/analysis")
for (i in 1:ncolse){
  servico<-print(list[i:i,])
  bm <- cm * se[,i:i] 
  bm_ave<-as.data.frame(apply(bm, 2, sum))
  csv=".csv"
  servico2<-as.data.frame(print(list[i:i,]))
  colnames(bm_ave)<-servico2[1:1,]
  write.csv(bm_ave,paste(servico,csv))
}
getwd()
temp <- list.files(pattern="*.csv")
named.list <- lapply(temp, read.csv)
library(data.table)
require(abind)
arr <- abind(named.list)
com <- arr[, !duplicated(colnames(arr))]
colnames(com)[1] <- "site_ID"
#com = com[,!(colSums(com) == 0)]
#colSums(com)
head(com)
write.csv(com,"ESs_defaunada_ruim_2.csv",row.names=TRUE) # SAVE REGIME


# SALVAR AS PLANILHAS DEFAUNADA E ORIGINAL

setwd("C:/Users/cap_a/OneDrive/Documentos/Doutorado/Capitulo_1/Defaunation/Data")
write.csv(baseline,"baseline.csv")
write.csv(defaunada,"defaunada_worst.csv")








