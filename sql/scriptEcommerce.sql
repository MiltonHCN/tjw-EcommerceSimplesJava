-- Database: ecommerce

CREATE DATABASE gadgets_store;
USE gadgets_store;

-- Estrutura da tabela produto
CREATE TABLE produto (
  id INTEGER NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  valor VARCHAR(50) NOT NULL,
  imagem varchar(255) NOT NULL,
  PRIMARY KEY (id)
);

-- Estrutura da tabela usuario
CREATE TABLE usuario (
  id INTEGER NOT NULL AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL,
  senha VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

-- Dados para a tabela produto
INSERT INTO produto (nome, valor, imagem) VALUES 
('GeForce RTX 3060', '5300', 'img/GeForce_RTX_3060.png'),
('Memória XPG Spectrix', '300', 'img/Memoria_XPG_Spectrix.png'),
('Notebook Acer Nitro 5', '4900', 'img/Notebook_Acer_Nitro_5.png'),
('Teclado HyperX', '299',  'img/Teclado_HyperX.png');

-- Dados para a tabela usuario
INSERT INTO usuario (username, senha) VALUES ('fulano', '123');
