create database Rotina_Vendedor;

CREATE TABLE Vendedor (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(255),
    comissao DECIMAL(10,2),
    faturamento_acumulado DECIMAL(10,2)
);


CREATE TABLE Cliente (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(255),
    limite_credito DECIMAL(10,2),
    codigo_vendedor INT,
    FOREIGN KEY (codigo_vendedor) REFERENCES Vendedor(codigo)
);


CREATE TABLE Peca (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(255),
    preco DECIMAL(10,2),
    quantidade_estoque INT,
    numero_armazem INT,
    FOREIGN KEY (numero_armazem) REFERENCES Armazem(codigo)
);


CREATE TABLE Armazem (
    codigo INT PRIMARY KEY,
    endereco VARCHAR(255)
);


CREATE TABLE Pedido (
    numero INT PRIMARY KEY,
    data DATE,
    codigo_cliente INT,
    codigo_vendedor INT,
    FOREIGN KEY (codigo_cliente) REFERENCES Cliente(codigo),
    FOREIGN KEY (codigo_vendedor) REFERENCES Vendedor(codigo)
);


CREATE TABLE ItemPedido (
    numero_pedido INT,
    codigo_peca INT,
    quantidade INT,
    preco_cotado DECIMAL(10,2),
    PRIMARY KEY (numero_pedido, codigo_peca),
    FOREIGN KEY (numero_pedido) REFERENCES Pedido(numero),
    FOREIGN KEY (codigo_peca) REFERENCES Peca(codigo)
);

insert into vendedor values
(1,'abc', 'abc', '10.5', '20.5');

insert into cliente values 
(1,'abc','def','10.5', 2);

insert into peca values 
('1','abc', '10.5','1','2');