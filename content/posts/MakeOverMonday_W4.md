---
title: "Makeover Monday 2020 W/4"
description: "Makeover Monday 2020 W/4"
date: "2020-02-08"
categories:
  - "makeovermonday"
  - "dataviz"
tags:
  - "makeovermonday"
  - "dataviz"
  - "blog"
---
O Makeover Monday é um projeto em forma de dashboard que é publicado por algum dos participantes e deve ser refeito por quem desejar. Semanalmente o exemplo de dataset é publicado no site.

![](https://miro.medium.com/max/734/1*O9kL5tFTFYeHyK8dV2NOhg.png)

#### O tema da semana 4 é: Pontes para a prosperidade.
A Bridges to Prosperity (B2P) trabalha com comunidades isoladas para criar acesso a cuidados essenciais de saúde, educação e oportunidades econômicas através da construção de passarelas sobre rios intransitáveis.
Desde 2001, a B2P trabalha com comunidades em 20 países para construir 318 pontes que coletivamente fornecem acesso seguro a 1,1 milhão de pessoas.
## Versão original

 Você pode conferir a versão original aqui.

![](https://miro.medium.com/max/1769/1*oKnBJbvxupPNljHDirCOSA.png)

 Boas práticas:
- Uso de mapa


## Minha versão
#### Como desenvolvi?

Escolhi o Power BI por ser uma ferramenta a qual tenho mais familiaridade e pela facilidade de acesso externo. A medida original do uso de pesticida estava em libra, eu realizei a conversão adicionando uma coluna para dar o resultado em Kg.

O formato xls é designado para versões mais antigas do excel, quando vamos salvar um arquivo, em pt-br aparece como “Pasta de Trabalho do Excel 97- Excel 2003”
![](https://miro.medium.com/max/442/1*IZbfZZxhK5XxX8sSqDi2tQ.png)


## Resultado

![](https://miro.medium.com/max/1012/1*l0MygUcOBVUhE4s6IDK9vA.png)

Eu criei medidas usando DAX para dar o resultado individual quantidade de pontes por país, a fórmula está no quadro a seguir:
```
Bridges quantity = CALCULATE(COUNTA('Bridges Dataset'[Country]);filter(all('Bridges Dataset'[Country]);'Bridges Dataset'[Country]='Bridges Dataset'[Country]))
```

## Ponto que queria mostrar:
- Mapa geral
- Seleção por país
- Estatísticas dos países

## Links
- O link sobre o Make Over Monday desta semana está [aqui](https://data.world/makeovermonday/2020w4).
- O link para a minha visualização feita no Power BI está [aqui](https://github.com/mrncstt/makeovermonday/tree/master/2020_W4).
