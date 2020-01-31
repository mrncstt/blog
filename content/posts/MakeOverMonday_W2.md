---
title: "Makeover Monday 2020 W/2"
description: "Makeover Monday 2020 W/2"
date: "2020-01-14"
categories:
  - "makeovermonday"
  - "dataviz"
tags:
  - "makeovermonday"
  - "dataviz"
  - "blog"
---
O Makeover Monday é um projeto em forma de dashboard que é publicado por algum dos participantes e deve ser refeito por quem desejar. Semanalmente o exemplo de dataset é publicado no site.

![](https://miro.medium.com/max/641/1*5K4uFM-b4QO7-Ezw_lSHlw.png)

O tema da semana 2 é: Os EUA ficam atrás de outras nações agrícolas na proibição de pesticidas nocivos. Quatro dos maiores produtores agrícolas do mundo são EUA, UE (União Européia), China e Brasil. Cada um possui sistemas reguladores de pesticidas separados e distintos, projetados para proteger, em graus variados, os seres humanos e o meio ambiente. Uma pesquisa realizada em 2016 concluiu que 27,3% dos pesticidas usados ​​pelos EUA, sendo 328 M de libras (aproximadamente 148.7 M de Kilos), são proibidos em pelo menos uma das outras nações. Existem 85 pesticidas aprovados pelos EUA, que são proibidos na UE, Brasil ou China.

## Versão original

 Você pode conferir a versão original aqui.

![](https://miro.medium.com/max/685/1*pE_EHv6m1C6WTcVd4vOnHQ.png)

 Boas práticas:
- Comparativo centralizado
- Simplificação da legenda

## Minha versão
#### Como desenvolvi?

Escolhi o Power BI por ser uma ferramenta a qual tenho mais familiaridade e pela facilidade de acesso externo. A medida original do uso de pesticida estava em libra, eu realizei a conversão adicionando uma coluna para dar o resultado em Kg.

![](https://miro.medium.com/max/356/1*RgC0bgDYO3A5m077y__nVQ.png)
![](https://miro.medium.com/max/808/1*WvV_G9DdwcxeEODP3xDTrQ.png)

## Resultado

![](https://miro.medium.com/max/863/1*Kd5B_XwmWRczrdroMLENag.png)

Eu criei medidas usando DAX para dar o resultado individual usando elementos de cartão, a fórmula está no quadro a seguir:

```
brazil = CALCULATE(SUM(Countries[Kg. Pesticides Used in USA Agriculture]);Countries[Texto Após o Delimitador] = "BRA")
```

## Ponto que queria mostrar:
  - Resultado em Kg
  - Comparativos separados

## Links
- O link sobre o Make Over Monday desta semana está [aqui](https://data.world/makeovermonday/2020w2).
- O link para a minha visualização feita no Power BI está [aqui](https://app.powerbi.com/view?r=eyJrIjoiMDAzNDk0YzctNTZjZS00ZTM2LTg4NGUtZTkwZTJmYTg3NjUwIiwidCI6ImRjYmYyYTFmLTk1MzItNGQ1Ni1hYzQxLTU2MTVlMzhlNTBiNyJ9).
