CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(50) NOT NULL
);

CREATE TABLE produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(50) NOT NULL
);

CREATE TABLE produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE categorias (
    id INT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    cliente_id INT NOT NULL,
    data DATE NOT NULL
);

CREATE TABLE itens_pedido (
    pedido_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (pedido_id, produto_id)
);

INSERT INTO clientes (id, nome, cidade) VALUES
(1, 'Oficina MotoSpeed', 'Manaus'),
(2, 'João Silva', 'Manaus'),
(3, 'Oficina Duas Rodas', 'Iranduba'),
(4, 'Carlos Henrique', 'Manaus'),
(5, 'Moto Center Norte', 'Manacapuru');

INSERT INTO produtos (id, nome, preco) VALUES
(1, 'Pneu Michelin 150/70', 850.00),
(2, 'Óleo Motor 10W40', 45.00),
(3, 'Pastilha de Freio', 120.00),
(4, 'Kit Relação (corrente + coroa)', 300.00),
(5, 'Bateria 12V', 400.00),
(6, 'Filtro de Ar', 60.00),
(7, 'Velas de Ignição', 35.00),
(8, 'Disco de Freio', 250.00);

INSERT INTO pedidos (id, cliente_id, data) VALUES
(1, 1, '2026-01-10'),
(2, 2, '2026-01-12'),
(3, 3, '2026-02-05'),
(4, 4, '2026-02-20'),
(5, 1, '2026-03-01'),
(6, 5, '2026-03-15'),
(7, 2, '2026-03-18'),
(8, 3, '2026-04-02');

INSERT INTO itens_pedido (pedido_id, produto_id, quantidade) VALUES
(1, 1, 2),
(1, 2, 10),
(2, 3, 4),
(2, 2, 5),
(3, 4, 3),
(3, 2, 8),
(4, 5, 2),
(4, 6, 6),
(5, 1, 1),
(5, 7, 10),
(6, 8, 2),
(6, 3, 5),
(7, 2, 12),
(7, 6, 3),
(8, 4, 2),
(8, 5, 1);

ALTER TABLE clientes ADD tipo VARCHAR(20);
UPDATE clientes SET tipo = 'Oficina' WHERE id IN (1,3,5);
UPDATE clientes SET tipo = 'Pessoa Física' WHERE id IN (2,4);

ALTER TABLE produtos ADD categoria_id INT;
INSERT INTO categorias (id, nome) VALUES
(1, 'Pneus'),
(2, 'Lubrificantes'),
(3, 'Freio'),
(4, 'Transmissão'),
(5, 'Elétrica'),
(6, 'Filtro'),
(7, 'Ignição');
UPDATE produtos SET categoria_id = 1 WHERE id = 1;
UPDATE produtos SET categoria_id = 2 WHERE id = 2;
UPDATE produtos SET categoria_id = 3 WHERE id = 3;
UPDATE produtos SET categoria_id = 4 WHERE id = 4;
UPDATE produtos SET categoria_id = 5 WHERE id = 5;
UPDATE produtos SET categoria_id = 6 WHERE id = 6;
UPDATE produtos SET categoria_id = 7 WHERE id = 7;
UPDATE produtos SET categoria_id = 3 WHERE id = 8;

ALTER TABLE produtos ADD custo DECIMAL(10,2);
UPDATE produtos SET custo = 600 WHERE id = 1;
UPDATE produtos SET custo = 25 WHERE id = 2;
UPDATE produtos SET custo = 70 WHERE id = 3;
UPDATE produtos SET custo = 200 WHERE id = 4;
UPDATE produtos SET custo = 300 WHERE id = 5;
UPDATE produtos SET custo = 30 WHERE id = 6;
UPDATE produtos SET custo = 15 WHERE id = 7;
UPDATE produtos SET custo = 150 WHERE id = 8;

ALTER TABLE pedidos ADD pagamento VARCHAR(20);
UPDATE pedidos SET pagamento = 'Pix' WHERE id IN (1,3,6);
UPDATE pedidos SET pagamento = 'Cartão' WHERE id IN (2,5,7);
UPDATE pedidos SET pagamento = 'Boleto' WHERE id IN (4,8);

ALTER TABLE pedidos
ADD CONSTRAINT fk_cliente
FOREIGN KEY (cliente_id) REFERENCES clientes(id);

ALTER TABLE itens_pedido
ADD CONSTRAINT fk_pedido
FOREIGN KEY (pedido_id) REFERENCES pedidos(id);

ALTER TABLE itens_pedido
ADD CONSTRAINT fk_produto
FOREIGN KEY (produto_id) REFERENCES produtos(id);

ALTER TABLE produtos
ADD CONSTRAINT fk_categoria
FOREIGN KEY (categoria_id) REFERENCES categorias(id);CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(50) NOT NULL
);

SELECT * FROM clientes;