# sistema-oficina-mecanica

# Sistema de Controle de Ordens de Serviço - Oficina Mecânica

## Descrição do Projeto
Este projeto foi desenvolvido como parte de um desafio para implementar um sistema de controle e gerenciamento de ordens de serviço em uma oficina mecânica. O sistema permite gerenciar as ordens de serviço dos clientes, associando os veículos, mecânicos, serviços e peças envolvidos em cada ordem.

## Entidades
O sistema é composto pelas seguintes entidades principais:
1. **Cliente**: Representa os clientes da oficina, contendo informações como nome, CPF e endereço.
2. **Veículo**: Cada cliente pode ter um ou mais veículos. O sistema armazena informações sobre o veículo, como a placa, marca, modelo e ano.
3. **Mecânico**: Os mecânicos são responsáveis pela execução dos serviços. O sistema mantém um registro do nome, código, endereço e especialidade de cada mecânico.
4. **Ordem de Serviço (OS)**: Cada ordem de serviço está associada a um veículo e contém informações sobre a data de emissão, a data de conclusão, o valor total, o status e os mecânicos responsáveis.
5. **Serviço**: Cada serviço possui uma descrição e um valor unitário. Serviços são associados às ordens de serviço.
6. **Peça**: As peças necessárias para os serviços também são registradas no sistema, com uma descrição e um valor unitário.
7. **Serviço por OS**: Relaciona uma ordem de serviço com os serviços executados nela.
8. **Peça por OS**: Relaciona uma ordem de serviço com as peças utilizadas nela.

## Relacionamentos
- **Cliente → Veículo**: Relacionamento 1:N (Um cliente pode ter vários veículos, mas cada veículo pertence a um único cliente).
- **Veículo → Ordem de Serviço**: Relacionamento 1:N (Cada veículo pode ter várias ordens de serviço, mas cada ordem de serviço refere-se a um único veículo).
- **Ordem de Serviço → Mecânico**: Relacionamento N:M (Uma ordem de serviço pode envolver vários mecânicos, e um mecânico pode estar em várias ordens de serviço).
- **Ordem de Serviço → Serviço**: Relacionamento N:M (Uma ordem de serviço pode ter múltiplos serviços associados).
- **Ordem de Serviço → Peça**: Relacionamento N:M (Uma ordem de serviço pode envolver várias peças).

## Como Rodar
1. Clone o repositório: `git clone https://github.com/seu_usuario/sistema-oficina.git`
2. Importe o esquema do banco de dados em seu sistema de gerenciamento de banco de dados preferido (MySQL, PostgreSQL, etc.).
3. Insira dados nas tabelas de acordo com os exemplos ou crie novos dados.
4. Execute as consultas e relatórios conforme necessário.

## Observações
- O esquema conceitual foi implementado com base nas informações fornecidas. Algumas entidades e relacionamentos podem ser ajustados conforme novos requisitos ou informações sejam fornecidas.

## Contribuição
Sinta-se à vontade para contribuir com melhorias ou ajustes no sistema. Abra uma **issue** ou envie um **pull request**.

_____
DAdos
____

1. Entidades e Atributos
Cliente
ID_Cliente (chave primária, INT)
Nome (VARCHAR)
CPF (CHAR)
Endereço (VARCHAR)
Veículo
ID_Veículo (chave primária, INT)
Placa (VARCHAR)
Marca (VARCHAR)
Modelo (VARCHAR)
Ano (INT)
ID_Cliente (chave estrangeira, INT - Cliente)
Mecânico
ID_Mecânico (chave primária, INT)
Nome (VARCHAR)
Código (VARCHAR)
Endereço (VARCHAR)
Especialidade (VARCHAR)
Ordem de Serviço (OS)
ID_OS (chave primária, INT)
Número da OS (INT)
Data de Emissão (DATE)
Data de Conclusão (DATE)
Valor Total (DECIMAL)
Status (ENUM - "Em andamento", "Concluída", "Cancelada")
ID_Veículo (chave estrangeira, INT - Veículo)
ID_Mecânico (chave estrangeira, INT - Mecânico, pode ser N:M)
Serviço
ID_Serviço (chave primária, INT)
Descrição (VARCHAR)
Valor Unitário (DECIMAL)
Peça
ID_Peça (chave primária, INT)
Descrição (VARCHAR)
Valor (DECIMAL)
Serviço por OS
ID_OS (chave estrangeira, INT - Ordem de Serviço)
ID_Serviço (chave estrangeira, INT - Serviço)
Quantidade (INT)
Peça por OS
ID_OS (chave estrangeira, INT - Ordem de Serviço)
ID_Peça (chave estrangeira, INT - Peça)
Quantidade (INT)
2. Relacionamentos
Cliente → Veículo: Relacionamento 1:N (Um cliente pode ter vários veículos, mas um veículo pertence a um único cliente).
Veículo → Ordem de Serviço: Relacionamento 1:N (Cada veículo pode ter várias ordens de serviço, mas cada ordem de serviço refere-se a um único veículo).
Ordem de Serviço → Mecânico: Relacionamento N:M (Uma ordem de serviço pode envolver vários mecânicos, e um mecânico pode estar em várias ordens de serviço).
Ordem de Serviço → Serviço: Relacionamento N:M (Uma ordem de serviço pode ter múltiplos serviços associados).
Ordem de Serviço → Peça: Relacionamento N:M (Uma ordem de serviço pode envolver várias peças).
3. Considerações sobre Entidades Não Definidas
Na narrativa, não são especificados alguns detalhes, como uma tabela de referência de mão-de-obra (para calcular o valor do serviço) ou detalhes sobre o
valor das peças, que provavelmente virão de um catálogo ou inventário de peças. Em um sistema real, poderia haver uma tabela específica para armazenar
 os preços de mão-de-obra e os preços das peças, mas, por ora, elas estão sendo associadas diretamente nas ordens de serviço.
