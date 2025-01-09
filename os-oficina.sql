CREATE DATABASE oficina_mecanica;
USE oficina_mecanica;

-- Tabela de Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    email VARCHAR(100) UNIQUE
);

-- Tabela de Veículos
CREATE TABLE Veiculos (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    modelo VARCHAR(100) NOT NULL,
    marca VARCHAR(50),
    placa VARCHAR(10) UNIQUE,
    ano INT,
    cor VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Tabela de Mecânicos
CREATE TABLE Mecanicos (
    id_mecanico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    especialidade VARCHAR(100)
);

-- Tabela de Serviços
CREATE TABLE Servicos (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    tempo_estimado INT,  -- em horas
    valor_hora DECIMAL(10, 2) NOT NULL
);

-- Tabela de Ordens de Serviço
CREATE TABLE Ordens_Servico (
    id_os INT AUTO_INCREMENT PRIMARY KEY,
    id_veiculo INT,
    id_mecanico INT,
    data_emissao DATE NOT NULL,
    valor_total DECIMAL(10, 2),
    status ENUM('Em andamento', 'Concluída', 'Cancelada') DEFAULT 'Em andamento',
    data_conclusao DATE,
    FOREIGN KEY (id_veiculo) REFERENCES Veiculos(id_veiculo),
    FOREIGN KEY (id_mecanico) REFERENCES Mecanicos(id_mecanico)
);

-- Tabela de Itens da Ordem de Serviço (Serviços realizados)
CREATE TABLE Itens_Ordem_Servico (
    id_os INT,
    id_servico INT,
    quantidade INT DEFAULT 1,  -- Quantidade de vezes que o serviço será executado
    valor DECIMAL(10, 2),  -- Valor calculado do serviço
    PRIMARY KEY (id_os, id_servico),
    FOREIGN KEY (id_os) REFERENCES Ordens_Servico(id_os),
    FOREIGN KEY (id_servico) REFERENCES Servicos(id_servico)
);

-- Tabela de Peças
CREATE TABLE Pecas (
    id_peca INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL
);

-- Tabela de Itens de Peças (Peças usadas nas Ordens de Serviço)
CREATE TABLE Itens_Peca (
    id_os INT,
    id_peca INT,
    quantidade INT DEFAULT 1,
    valor DECIMAL(10, 2),  -- Valor total da peça
    PRIMARY KEY (id_os, id_peca),
    FOREIGN KEY (id_os) REFERENCES Ordens_Servico(id_os),
    FOREIGN KEY (id_peca) REFERENCES Pecas(id_peca)
);

-- Tabela de Tabela de Referência de Mão-de-Obra (valor por hora)
CREATE TABLE Tabela_Mao_De_Obra (
    id_servico INT,
    valor DECIMAL(10, 2),  -- Valor por hora de serviço
    PRIMARY KEY (id_servico),
    FOREIGN KEY (id_servico) REFERENCES Servicos(id_servico)
);

-- Relacionamento entre Mecânicos e Equipes
CREATE TABLE Equipes (
    id_equipe INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);

-- Relacionamento entre Mecânicos e Equipes (muitos para muitos)
CREATE TABLE Mecanico_Equipe (
    id_mecanico INT,
    id_equipe INT,
    PRIMARY KEY (id_mecanico, id_equipe),
    FOREIGN KEY (id_mecanico) REFERENCES Mecanicos(id_mecanico),
    FOREIGN KEY (id_equipe) REFERENCES Equipes(id_equipe)
);

-- Atribuição de equipes nas ordens de serviço (relacionamento entre OS e equipes)
ALTER TABLE Ordens_Servico ADD id_equipe INT;
ALTER TABLE Ordens_Servico ADD FOREIGN KEY (id_equipe) REFERENCES Equipes(id_equipe);

