---
title: "Nuvem de palavras com Qlik"
description: "Como criar uma nuvem de palavras no Qlik"
date: "2020-07-13"
categories:
  - "Qlik"
  - "dataviz"
tags:
  - "Qlik"
  - "dataviz"
  - "blog"
---
#### Contextualização 

Eu trabalhei como analista de dados no Grupo Vila, uma empresa do setor funerário que oferta serviços e produtos funerários, cemiteriais e planos de de assistência funerária. Na organização existem diversos projetos e dentro deles existe o Morada da Memória que é um memorial online que traz relatos de familiares e amigos(as) de pessoas queridas que já partiram e tem como objetivo preservar memórias e perpetuar emoções.


![](https://miro.medium.com/max/700/1*wEHOfAw9XC3ysz4lVacwag.png)

#### Como foi feito? 
No Grupo Vila o Qlik é utilizado como ferramenta de Business Intelligence. Lá migramos da versão do View para Cloud. Nessa versão é oferecida a pesquisa de texto completo em todos os campos. Trabalhar com análises sempre significou interagir visualmente.

Mas e se fosse possível tirar dúvidas e insights diretamente com a ferramenta?

![](https://miro.medium.com/max/355/1*TvtbVl4wk7oXurjsE1rmYQ.png)



Desde a versão de Fev/2020 ocorreram uma série de aprimoramentos nos mecanismos de NLP (processamento de linguagem natural) um mecanismo desenvolvido para melhor detecção de padrões, gerando sugestões mais relevantes. Para isso pensamos em insight a partir dos campos de comentários que são realizados no site do Morada da Memória para entender o que as pessoas mais dizem sobre seus entes.

![](https://miro.medium.com/max/700/1*eojhz0x-ZlJmypJx_1r-rw.png)


Após a conexão com o banco MySQL e carga de dados convertidos em um arquivo QVD, foi realizada a carga dos dados para o aplicativo.

![](https://miro.medium.com/max/490/1*REkstcGUF6miOOrczergSw.png)

Para poder dividir as palavras, eu usei a função SubField com parâmetro de espaço (‘ ’) para que dessa forma fosse dividida cada palavra e TRIM para remover qualquer outro espaço que pudesse ficar.

Com as palavras separadas eu criei um script para contas palavras que não estivessem em uma lista de elementos de coesão (exemplo: e, a, o, ou, ainda que) que criamos, pois não seriam informações pertinentes no momento.
```sql
    =Count({<WORDS-={‘E’,’DE’…}>}WORDS) | Fórmula para contagem dos distintos
```

E inserimos tags /palavras-chave a variável que realiza a contabilização e para que também possa ser usado no campo de pesquisa

![](https://miro.medium.com/max/579/1*atSPDH3zOGeMUPGiRU6uqw.png)

#### Resultado 
![](https://miro.medium.com/max/674/1*PMJZwpcV33OJSoZWeqvcpg.png)

A análise de sentimentos dessas palavras foi realizada como um tópico adicional dentro do painel em que ele está inserido, mas nos fornece algumas umas ideias muito interessantes de como essas recordações são trazidas à memória.

