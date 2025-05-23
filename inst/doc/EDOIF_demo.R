## ----create.data, message=FALSE-----------------------------------------------
# Simulation section
nInv<-100
initMean=10
stepMean=20
std=8
simData1<-c()
simData1$Values<-rnorm(nInv,mean=initMean,sd=std)
simData1$Group<-rep(c("C1"),times=nInv)
simData1$Values<-c(simData1$Values,rnorm(nInv,mean=initMean,sd=std) )
simData1$Group<-c(simData1$Group,rep(c("C2"),times=nInv))
simData1$Values<-c(simData1$Values,rnorm(nInv,mean=initMean+2*stepMean,sd=std) )
simData1$Group<-c(simData1$Group,rep(c("C3"),times=nInv) )
simData1$Values<-c(simData1$Values,rnorm(nInv,mean=initMean+3*stepMean,sd=std) )
simData1$Group<-c(simData1$Group, rep(c("C4"),times=nInv) )
simData1$Values<-c(simData1$Values,rnorm(nInv,mean=initMean+4*stepMean,sd=std) )
simData1$Group<-c(simData1$Group, rep(c("C5"),times=nInv) )

## -----------------------------------------------------------------------------
# Simple ordering inference section
library(EDOIF)
# parameter setting
bootT=1000 # Number of times of sampling with replacement
alpha=0.05 # significance  significance level

#======= input
Values=simData1$Values
Group=simData1$Group
#=============
A1<-EDOIF(Values,Group,bootT = bootT, alpha=alpha )

## -----------------------------------------------------------------------------
print(A1) # print results in text

## ----Fig1, echo=TRUE, fig.height=5, fig.width=7-------------------------------
plot(A1,options =1)

## ----Fig2, echo=TRUE, fig.height=5, fig.width=7-------------------------------
plot(A1,options =2)

## ----Fig3, echo=TRUE, fig.height=5, fig.width=7-------------------------------
out<-plot(A1,options =3)

## ----Fig4, echo=TRUE, fig.height=5, fig.width=7, message=FALSE----------------
library(EDOIF)
# parameter setting
bootT=1000
alpha=0.05
nInv<-1200

start_time <- Sys.time()
#======= input
simData3<-SimNonNormalDist(nInv=nInv,noisePer=0.01)
Values=simData3$Values
Group=simData3$Group
#=============
A3<-EDOIF(Values,Group, bootT=bootT, alpha=alpha, methodType ="perc")
A3
plot(A3)
end_time <- Sys.time()
end_time - start_time

## ----Fig5, echo=TRUE, fig.height=5, fig.width=7, message=FALSE----------------
library(ggplot2)

nInv<-1000
simData3<-SimNonNormalDist(nInv=nInv,noisePer=0.01)
#plot(density(simData3$V3))

dat <- data.frame(dens = c(simData3$V3, simData3$V5)
                   , lines = rep(c("B", "A"), each = nInv))
#Plot.
p1<-ggplot(dat, aes(x = dens, fill = lines)) + geom_density(alpha = 0.5) +xlim(-400, 400)+ ylim(0, 0.07) + ylab("Density [0,1]") +xlab("Values") + theme( axis.text.x = element_text(face="bold",  
                                      size=12) )
theme_update(text = element_text(face="bold", size=12)  )
p1$labels$fill<-"Categories"
plot(p1)



