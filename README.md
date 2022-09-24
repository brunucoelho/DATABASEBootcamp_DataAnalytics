# RefinamentoEcommerce_ModelagemBD
Refinamento do projeto conceitual de banco de dados de um E-commerce

### Descrição do Desafio 📑
O esquema deverá ser adicionado a um repositório do Github para futura avaliação do desafio de projeto. Adicione ao Readme a descrição do projeto conceitual para fornecer o contexto sobre seu esquema.
#### Objetivo:
Refine o modelo apresentado acrescentando os seguintes pontos:

- Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
- Pagamento – Pode ter cadastrado mais de uma forma de pagamento;
- Entrega – Possui status e código de rastreio;

##
1️⃣ objetivo:
 Crie um relacionamento TIPO DE CLIENTE com o atributo PF e (and) PJ, sendo a relação 1:N com a entidade Cliente. Gerando assim a obrigatoriedade do cliente ser classificado em PF ou PJ, não gerando dualidade nessa informação (atributo).
 
2️⃣ objetivo:
 Adicionei 3 relacionamentos. O primeiro foi o DADOS DO CARTÃO, com os atributos necessários de cartão de crédito, podendo ter vários cartões associados a um cliente e assim gerando uma relação 1:N para o segundo relacionamento criado, PAGAMENTO, com os atribuitos Cartões, Boleto e Pix do cliente, pois esse segundo relacionamento tem relacionamento com a entidade CLIENTE. O terceiro relacionamento foi BOLETO, fazendo relaçao 1:1 com PAGAMENTO e esse ultimo conectado com CLIENTE. Foi percebido uma relação fraca dos relacionamentos criados, pórem deixei de lado.
 
3️⃣ obejtivo:
Fiz a entidade ENTREGA com os atributos solicitados, status, código de rastreio, além de endereço e fiz uma relação N:M com a entidade PEDIDO. Pois a mesma faz um relaciomento indireo com a entidade ESTOQUE, além disso adicionei o atributo de cód. de rastreio na entidade PEDIDO.

##
#### O ESQUEMA DO PROJETO CONCEITUAL ESTÁ INSERIDO NESTE REPOSITÓRIO.
 
