#Teste de Hipotese
#Ano: 2015
#Autor: Juliana Balera



#DADOS
dados_comparacao_1<-c(86,18,99,67,135,175,217,263,58,47,116,48,163,321,321,269,114,514,501,169,585,460,268,1393,674)  
dados_comparacao_2<-c(71,15,76,56,60,84,113,168,54,47,99,41,136,263,263,254,109,464,458,175,522,420,242,1330,609) 

### Verificando a normalidade dos dados
## verificar graficamente
# histogramas
hist(dados_comparacao_1)
hist(dados_comparacao_2)
# qqplot
qqnorm(dados_comparacao_1)
qqline(dados_comparacao_1)
qqnorm(dados_comparacao_2)
qqline(dados_comparacao_2)
## determinar o Skewness e Kurtosis 
# incluir a biblioteca agricolae
library(agricolae)

skewness(dados_comparacao_1)
skewness(dados_comparacao_2)

kurtosis(dados_comparacao_1)
kurtosis(dados_comparacao_2)

## Teste de Shapiro-Wilk 
shapiro.test(dados_comparacao_1)
shapiro.test(dados_comparacao_2)

###############################################################
# Verificada a nao distribuicao normal dos dados, o proximo   #
# passo e a adocao do teste de Wilcoxon signed rank para      #
# verificar as hipoteses.                                     # 
###############################################################

#Teste de Wilcoxon signed rank 
wilcox.test(dados_comparacao_1, dados_comparacao_2, paired=TRUE)

## Os testes de Wilcoxon mostraram a presenca de ties, por isso ? necessario a aplicacao do teste wilcox.exact() 
library(exactRankTests) #inclusao da biblioteca

wilcox.exact(dados_comparacao_1, dados_comparacao_2, paired=TRUE, alternative="two.sided", exact=FALSE)
## graficos boxplot

boxplot(dados_comparacao_1, dados_comparacao_2, names=c("Dados comparacao 1", "dados comparacao 2"))
