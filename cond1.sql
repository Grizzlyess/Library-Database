create database condado;
use condado;

create table cliente(
	id_cliente varchar(36) PRIMARY KEY, 
    Nome_cliente varchar(255),
    Email_c varchar(255),
    C_rua varchar(255),
    C_N°  varchar(255),
    C_Bairro varchar(255),
    C_CEP varchar(255),
    C_Cidade varchar(255),
    C_Estado varchar(255)
);


create table contato_cliente (
    contato_cliente varchar(20),
    id_cliente varchar(36), 
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);


create table fisico (
    CPF varchar(20) unique,
    id_cliente varchar(36) , 
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);


create table juridico (
    CNPJ varchar(20) unique,
    id_cliente varchar(36), 
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);


create table fornecedor(
id_fornecedor varchar(36) primary key,
nome_fornecedor varchar(255),
email_f varchar(255),
f_rua varchar(255),
f_N° varchar(255),
f_Bairro varchar(255),
f_CEP varchar(255),
f_Cidade varchar(255),
f_Estado varchar(255),
contato_fornecedor varchar(255)
);


create table pedido(
id_pedido varchar(36) primary key, 
id_cliente varchar(36),
data_p varchar(36),
forma_pagamento varchar(36),
Preço_pedido float(10),
P_rua varchar(255),
P_N° varchar(255),
P_Bairro varchar(255),
P_CEP varchar(255),
P_Cidade varchar(255),
P_Estado varchar(255),
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);


create table livro(
ISBN varchar(36) primary key ,
id_fornecedor varchar(255), /*CHAVE ESTRANGEIRA*/
gênero varchar(255),
título varchar(255),
sinopse varchar(700),
preço_produto float(10),
QTD_estoque int,
FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor)

);


CREATE TABLE pedido_livro (
    ISBN varchar(36),
    id_pedido varchar(36),
    QTD_pedido int,
    PRIMARY KEY (ISBN, id_pedido),
    FOREIGN KEY (ISBN) REFERENCES livro(ISBN),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);


create table autor(
id_autor varchar(36) primary key,
nome_autor  varchar(255),
contato_autor  varchar(255),
email_autor  varchar(255)
);

create table livro_autor(
ISBN varchar(36),
id_autor varchar(36),
publicação varchar(255),
edição varchar(255),
PRIMARY KEY (ISBN, id_autor),
foreign key(ISBN) references livro(ISBN),
foreign key(id_autor) references autor(id_autor)
);

/*INSERINDO DADOS*/
INSERT INTO cliente (id_cliente, Nome_cliente, Email_c, C_rua, C_N°, C_Bairro, C_CEP, C_Cidade, C_Estado)
VALUES
('A', 'Bilbo Bolseiro', 'hobbit_precioso@gmail.com', 'Rua da Aventura', '42', 'Bolsão da Colina', '79062-285', 'Campo Grande', 'MS'),
('B', 'Naruto Uzumaki', 'futurohokage@hotmail.com', 'Alameda dos Hokages', '7', 'Vila da Folha', '23812-310', 'Recife', 'PE'),
('C', 'Saul Goodman', 'melhoradvogadoconfia@gmail.com', 'Avenida da Oportunidade', '505', 'Bairro Legal', '62800-000', 'Aracati', 'CE'),
('D', 'Saint Seiya', 'SaintSeiya@gmail.com', 'Praça dos Pégasos', '88', 'Santuário das Doze Casas', '48903-435', 'Petrolina', 'PE'),
('E', 'Manuel Gomes', 'ManuelGomescanetaazuloficial@gmail.com', 'Travessa da Simpatia', '23', 'Vila Encantada', '62736-000', 'Paramoti', 'CE'),
('F', 'Paola Oliveira', 'PaolaOliveira@icloud.com', 'Rua das Estrelas', '123', 'Projac', '64000-290', 'Teresina', 'PI'),
('G', 'Daenerys Targaryen', 'mae_de_dragoes@hotmail.com', 'Pedra do Dragão', '7', 'Baia da Água Negra', '75802-095', 'Jataí', 'GO'),
('H', 'Ednaldo Pereira', 'EdnaldoPereirarealoficial@hotmail.com', 'Rua do Hit', '17', 'Bairro da Melodia', '06803-440', 'Fortaleza', 'CE'),
('I', 'Hermione Granger', 'HermioneGranger@gmail.com', 'Beco Diagonal', '9½', 'Hogwarts', '86105-000', 'Londrina', 'PR'),
('J', 'Marciano Lourenço', 'MarcianoLourenco@ifce.edu.br', 'Rua me dá um ponto', '33', 'Bairro Quero Passar', '62800-000', 'Aracati', 'CE'),
('K', 'Bruce Wayne', 'naosouobatman@icloud.com', 'Mansão Wayne', '1007', 'Gotham Heights', '66055-260', 'Belém', 'PA'),
('L', 'Walter White', 'ProffWalterWhite@gmail.com', 'Caminho do Cristal Azul', '308', 'Subúrbio Químico', '71020-631', 'Brasília', 'DF'),
('M', 'Barry Allen', 'naosouoflashconfia@gmail.com', 'Força de Acelereção', '52', 'Avenida da Velocidade', '62011-140', 'Sobral', 'CE'),
('N', 'Geralt de Rívia', 'Bruxaomatador123@hotmail.com', 'Rua dos Bruxos', '17', 'Vila Kaer Morhen', '20040-002', 'Rio de Janeiro', 'RJ'),
('O', 'Bill Gates', 'billg@microsoft.com', 'Boulevard da Inovação', '10', 'Bairro Tecnológico', '01011-100', 'Osasco', 'SP');


INSERT INTO contato_cliente (contato_cliente, id_cliente) VALUES
('555-3579-1268', 'A'),
('4002-8922', 'A'),
('555-1234-5678', 'B'),
('555-9876-5432', 'C'),
('555-2468-1357', 'D'),
('555-8642-0975', 'E'),
('555-8642-1973', 'E'),
('555-3197-8024', 'F'),
('234-5678', 'G'),
('555-6051-3847', 'H'),
('555-4381-9562', 'I'),
('555-6702-3418', 'J'),
('555-1234-5678', 'K'),
('555-7382-6901', 'K'),
('555-4763-9285', 'L'),
('555-8109-2736', 'M'),
('555-9876-5432', 'N'),
('555-3645-8192', 'N'),
('555-2468-1357', 'O'),
('555-9218-5074', 'O');


INSERT INTO fisico (CPF, id_cliente) VALUES
('284.053.619-78', 'A'),
('730.615.982-84', 'B'),
('651.320.182-85', 'C'),
('805.694.213-72', 'D'),
('149.532.860-27', 'E'),
('860.194.237-52', 'F'),
('372.841.560-96', 'G'),
('651.320.784-97', 'H');


INSERT INTO juridico (CNPJ, id_cliente) VALUES
('70.513.249/8620-47', 'I'),
('36.951.842/0765-93', 'J'),
('81.406.275/3249-18', 'K'),
('53.029.864/1724-76', 'L'),
('24.967.035/1827-84', 'M'),
('18.503.749/2630-21', 'N'),
('96.041.325/7384-12', 'O');


INSERT INTO fornecedor (id_fornecedor, nome_fornecedor, email_f, f_rua, f_N°, f_Bairro, f_CEP, f_Cidade, f_Estado, contato_fornecedor)
VALUES
    ('1', 'Rocco', 'rocco.editora@hotmail.com', 'Travessa das Estrelas', '7618', 'Jardim Sereno', '20000-000', 'Rio de Janeiro', 'RJ', '(21) 3525-2000'),
    ('2', 'Intrínseca', 'intrinseca.editora@gmail.com', 'Rua Serenidade', '2547', 'Solar do Bosque', '21000-000', 'Rio de Janeiro', 'RJ', '(21) 3206-7400'),
    ('3', 'Seguinte', 'seguinte.editora@gmail.com', 'Avenida das Maravilhas', '4932', 'Vila das Artes', '30000-000', 'Belo Horizonte', 'MG', '(11) 3707-3500'),
    ('4', 'Darkside', 'darkside.editora@outlook.com', 'Beco Encantado', '1289', 'Terra dos Ventos', '01500-000', 'São Paulo', 'SP', '(21) 2556-3875'),
    ('5', 'Panini', 'panini.editora@hotmail.com', 'Caminho do Crepúsculo', '6743', 'Vale do Silêncio', '07000-000', 'Barueri', 'SP', '(11) 3512-9444'),
    ('6', 'Suma', 'suma.editora@gmail.com', 'Alameda das Ilusões', '3156', 'Parque da Aurora', '22000-000', 'Rio de Janeiro', 'RJ', '(21) 3993-7510'),
    ('7', 'Arqueiro', 'arqueiro.editora@gmail.com', 'Praça da Imaginação', '8921', 'Floresta Encantada', '01100-000', 'São Paulo', 'SP', '(11) 3868-4492'),
    ('8', 'HarperCollins', 'harper.editora@hotmail.com', 'Estrada da Alegria', '4476', 'Alameda das Marés', '02500-000', 'São Paulo', 'SP', '(21) 3175-1030'),
    ('9', 'Alt', 'alt.editora@gmail.com', 'Controle da Alvorada', '8922', 'Delegação do Norte', '04000-000', 'São Paulo', 'SP', '(21) 2534-5000'),
    ('10', 'NewPOP', 'online@newpop.com.br', 'Rua Falsa', '123', 'Norte do Sul', '08000-000', 'São Paulo', 'SP', '(11) 5539-2188');


INSERT INTO pedido (id_pedido, id_cliente, data_p, forma_pagamento, Preço_pedido, P_rua, P_N°, P_Bairro, P_CEP, P_Cidade, P_Estado)
VALUES
    ('A1', 'A', '01/03/2022', 'Crédito', 45.99, 'Rua da Aventura', '42', 'Bolsão da Colina', '13471-410', 'Campo Grande', 'MS'),
    ('B1', 'A', '02/03/2022', 'Débito', 124.80, 'Rua da Aventura', '42', 'Bolsão da Colina', '13471-410', 'Campo Grande', 'MS'),
    ('C1', 'A', '03/03/2022', 'Boleto', 704.50, 'Rua da Aventura', '42', 'Bolsão da Colina', '13471-410', 'Campo Grande', 'MS'),
    ('D1', 'B', '04/03/2022', 'Pix', 32.90, 'Alameda dos Hokages', '7', 'Vila da Folha', '23812-310', 'Recife', 'PE'),
    ('E1', 'B', '05/03/2022', 'Débito', 120.17, 'Alameda dos Hokages', '7', 'Vila da Folha', '23812-310', 'Recife', 'PE'),
    ('F1', 'B', '06/03/2022', 'Crédito', 114.90, 'Alameda dos Hokages', '7', 'Vila da Folha', '23812-310', 'Recife', 'PE'),
    ('G1', 'C', '07/03/2022', 'Pix', 82.02, 'Avenida da Oportunidade', '505', 'Bairro Legal', '62800-000', 'Aracati', 'CE'),
    ('H1', 'C', '08/03/2022', 'Boleto', 107.70, 'Avenida da Oportunidade', '505', 'Bairro Legal', '62800-000', 'Aracati', 'CE'),
    ('I1', 'C', '03/01/2022', 'Crédito', 46.12, 'Avenida da Oportunidade', '505', 'Bairro Legal', '62800-000', 'Aracati', 'CE'),
    ('J1', 'D', '08/04/2022', 'Débito', 159.90, 'Praça dos Pégasos', '88', 'Santuário das Doze Casas', '48903-435', 'Petrolina', 'PE'),
    ('K1', 'D', '13/07/2022', 'Boleto', 92.80, 'Praça dos Pégasos', '88', 'Santuário das Doze Casas', '48903-435', 'Petrolina', 'PE'),
    ('L1', 'E', '18/10/2022', 'Pix', 459.90, 'Travessa da Simpatia', '23', 'Vila Encantada', '62736-000', 'Paramoti', 'CE'),
    ('M1', 'E', '02/02/2023', 'Crédito', 102.54, 'Travessa da Simpatia', '23', 'Vila Encantada', '62736-000', 'Paramoti', 'CE'),
    ('N1', 'F', '09/04/2023', 'Boleto', 55.71, 'Rua das Estrelas', '123', 'Projac', '04757-120', 'Teresina', 'PI'),
    ('O1', 'F', '14/07/2023', 'Pix', 164.70, 'Rua das Estrelas', '123', 'Projac', '04757-120', 'Teresina', 'PI'),
    ('P1', 'G', '19/10/2023', 'Débito', 119.80, 'Pedra do Dragão', '7', 'Baia da Água Negra', '75400-586', 'Jataí', 'GO'),
    ('Q1', 'G', '05/02/2022', 'Pix', 59.90, 'Pedra do Dragão', '7', 'Baia da Água Negra', '75400-586', 'Jataí', 'GO'),
    ('R1', 'H', '10/05/2022', 'Crédito', 134.80, 'Rua do Hit', '17', 'Bairro da Melodia', '06803-440', 'Fortaleza', 'CE'),
    ('S1', 'H', '15/08/2022', 'Boleto', 152.47, 'Rua do Hit', '17', 'Bairro da Melodia', '06803-440', 'Fortaleza', 'CE'),
    ('T1', 'I', '20/11/2022', 'Débito', 45.99, 'Beco Diagonal', '9¾', 'Hogwarts', '36492-062', 'Londrina', 'PR'),
    ('U1', 'J', '07/05/2023', 'Crédito', 194.70, 'Rua do Mistério', '33', 'Área 51', '62800-000', 'Aracati', 'CE'),
    ('V1', 'K', '11/06/2023', 'Pix', 117.07, 'Mansão Wayne', '1007', 'Gotham Heights', '47806-421', 'Belém', 'PA'),
    ('W1', 'L', '16/09/2023', 'Boleto', 279.60, 'Caminho do Cristal Azul', '308', 'Subúrbio Químico', '70040-010', 'Brasília', 'DF'),
    ('X1', 'M', '21/12/2023', 'Débito', 190.76, 'Força de Aceleração', '52', 'Avenida da Velocidade', '62010-001', 'Sobral', 'CE'),
    ('Y1', 'N', '07/02/2022', 'Crédito', 128.92, 'Rua dos Bruxos', '17', 'Vila Kaer Morhen', '05407-002', 'Rio de Janeiro', 'RJ'),
    ('Z1', 'O', '12/05/2022', 'Boleto', 399.90, 'Boulevard da Inovação', '10', 'Bairro Tecnológico', '01011-100', 'Osasco', 'SP');


INSERT INTO livro (ISBN, id_fornecedor, gênero, título, sinopse, preço_produto, QTD_estoque)
VALUES
('9788532523051', '1', 'Fantasia', 'Harry Potter e a Pedra Filosofal', 'Harry Potter, órfão maltratado, descobre aos 11 anos seu destino mágico. Herói marcado por sobreviver a um ataque bruxo, ele enfrentará o assassino dos pais. Magricela e desengonçado, torna-se líder e símbolo de poder entre os feiticeiros.', 45.99, 2),
('9788532505705', '1', 'Fantasia', 'Harry Potter BOX', 'Harry Potter, jovem bruxo, luta contra as trevas de Lord Voldemort, descobrindo amizades e segredos na Escola de Magia de Hogwarts, em uma saga épica de magia e coragem', 399.90, 2),
('9788551008881', '2', 'Aventura', 'Box Percy Jackson e os olimpianos', 'Percy Jackson, semideus, embarca em missões perigosas para evitar conflitos entre deuses, enfrentando criaturas míticas, descobrindo seu destino e desvendando mistérios no mundo dos semideuses', 299.50, 5),
('9788580575392', '2', 'Aventura', 'O Ladrão de Raios - Percy Jackson e os Olimpianos 1', 'Percy Jackson, filho de Poseidon, é acusado de roubo no Olimpo. Com seus amigos, ele enfrenta deuses e monstros para desvendar uma traição ameaçadora. A saga combina mitologia grega, aventura contemporânea e desafios para jovens heróis.', 34.90, 3),
('9788594541833', '4', 'True crime', 'BTK Profile: Máscara da Maldade', 'Explora os crimes brutais do assassino em série BTK, mergulhando nas mentes obscuras e nas investigações angustiantes que revelam seu lado aterrador.', 79.90, 20),
('9788594541475', '4', 'True crime', 'Lady Killers: Assassinas em Série', 'Revela histórias chocantes de mulheres criminosas, desafiando estereótipos e explorando os motivos obscuros por trás de seus atos mortais', 79.90, 10),
('9788584391400', '4', 'Romance', 'Daisy Jones and The Six', 'O livro narra a história fictícia de uma banda de rock dos anos 1970 chamada Daisy Jones & The Six. A narrativa é construída por meio de entrevistas com os membros da banda, revelando os altos e baixos de suas carreiras, relacionamentos e os eventos que levaram à sua separação.', 24.99, 18),
('9788584391509', '2', 'Romance', 'Os Sete Maridos de Evelyn Hugo', 'Evelyn Hugo, estrela de cinema, revela seus sete casamentos e segredos na glamorosa Hollywood, oferecendo uma narrativa cativante e reveladora', 59.90, 20),
('9788560280940', '6', 'Terror', 'It: A Coisa', 'Uma presença maligna assombra a cidade de Derry, ressurgindo a cada 27 anos. Um grupo de amigos enfrenta seus maiores medos para combatê-la.', 114.90, 20),
('9788556511348', '6', 'Terror', 'Carrie, a Estranha', 'Stephen King revela o sobrenatural na vida de uma adolescente com poderes telecinéticos, desencadeando eventos trágicos em sua jornada pelo ensino médio.', 69.90, 20),
('9788551006757', '2', 'Terror', 'Coraline', 'A trama segue Coraline Jones, uma menina curiosa que descobre uma porta secreta em sua casa que a leva a uma versão alternativa de sua vida. Nesse outro mundo, ela encontra seus "outros pais", que têm botões em vez de olhos. À medida que a história se desenrola, Coraline enfrenta desafios para salvar a si mesma e aos pais verdadeiros. A obra é conhecida por seu estilo peculiar e atmosfera surreal.', 59.42, 9),
('9788573516531', '5', 'Fantasia', 'Sandman', 'Neil Gaiman tece uma saga mágica que explora o mundo dos sonhos, repleta de deuses, mitos e personagens cativantes, desafiando realidade e fantasia.', 214.90, 20),
('9786555112511', '8', 'Fantasia', 'O Senhor dos Anéis: edição única', 'A saga "Senhor dos Anéis" narra a busca para destruir um anel do poder e derrotar o mal que ameaça a Terra-média, explorando amizade, coragem e o embate entre o bem e o mal.', 299.90, 5),
('9788595084742', '8', 'Fantasia', 'O Hobbit', 'Bilbo Bolseiro embarca em uma inesperada jornada com treze anões para recuperar um tesouro guardado por Smaug, o dragão. Aventura, magia e coragem definem sua saga.', 69.90, 20),
('9786555321449', '1', 'Aventura', 'Jogos Vorazes', 'Katniss Everdeen luta pela sobrevivência em uma competição brutal, onde tributos lutam até a morte. Um conto de resistência e sacrifício no distópico Panem.', 64.90, 20),
('9786587435916', '2', 'Romance', 'Emma', 'A história gira em torno da protagonista, Emma Woodhouse, uma jovem rica que gosta de fazer combinações amorosas entre seus conhecidos. No entanto, suas tentativas muitas vezes resultam em situações cômicas e complexas. O romance aborda temas como amor, classe social e amadurecimento.', 70.19, 7),
('9788544001820', '2', 'Romance', 'Orgulho e Preconceito', 'O sonho da Sra. Bennet era casar bem suas cinco filhas: Jane, Elizabeth, Mary, Kitty e Lydia. Entre as irmãs, destaca-se Elizabeth, a Lizzy, que se depara com um turbilhão de sentimentos diante do orgulho e preconceito que mascaram a realidade.', 55.71, 20),
('9788535933925', '7', 'História', 'Sapiens: Uma Breve Historia da Humanidade', 'Obra de Yuval Noah Harari explora a evolução humana, destacando marcos como a Revolução Cognitiva, Agrícola e Científica que moldaram nossa sociedade desde os primórdios até hoje', 64.46, 15),
('9788565859516', '3', 'História', 'A História do Mundo Para Quem Tem Pressa', '"A História do Mundo Para Quem Tem Pressa" oferece uma visão concisa dos eventos-chave da história global, proporcionando uma leitura rápida e acessível.', 38.06, 15),
('9788555340949', '3', 'Romance', 'Vermelho, Branco e Sangue Azul', 'Explora um romance proibido entre um príncipe britânico e um jovem americano, desafiando convenções sociais e políticas, enquanto segredos ameaçam tudo que conhecem.', 59.90, 5),
('9786559827565', '5', 'HQ', 'Spy X Family Vol.1', 'Segue a história de um espião que busca formar uma família falsa para realizar uma missão crucial. Comédia, ação e laços improváveis se entrelaçam nessa envolvente trama de espionagem.', 37.90, 7),
('9786558380542', '2', 'Romance', 'A Biblioteca da Meia-Noite', 'Nora descobre uma biblioteca mágica que revela vidas não vividas, desencadeando uma jornada entre realidade e ficção.', 54.90, 6),
('9786584956193', '3', 'Filosofia', 'O Príncipe', 'O Príncipe de Maquiavel revela estratégias e reflexões sobre poder e governança na política, uma obra atemporal da filosofia política.', 61.03, 18),
('9788525417350', '3', 'Filosofia', 'Além do Bem e do Mal', 'Nietzsche questiona valores morais, explorando a dualidade humana e desafiando conceitos estabelecidos.', 59.78, 4),
('9788545709619', '5', 'HQ', 'Boa Noite Punpun', 'O mangá de Inio Asano mergulha na complexidade da adolescência, explorando amor, depressão e identidade de forma emocional', 58.53, 8),
('9788525065377', '9', 'Romance', 'Um Milhão de Finais Felizes', 'Jonas, perdido entre leituras e o Rocket Café, enfrenta conservadorismo dos pais. Ao conhecer Arthur, questiona suas escolhas. Buscando conforto nos amigos, descobre o poder de uma boa história.', 57.29, 5),
('9786586799156', '10', 'HQ', 'Rei de Lata', 'Em um mundo pós-guerra, uma arma biológica dizima um país. Crianças nascem com poderes extraordinários de sobrevivência, odiadas pelos adultos. Agora, elas lutam pela própria sobrevivência usando esses dons únicos.', 56.04, 7),
('9786589912439', '4', 'Terror', 'Histórias Assustadoras Para Contar à Noite', 'O leitor é transportado para um universo sombrio de contos macabros e terror, onde o medo espreita a cada página, revelando pesadelos que ganham vida quando as luzes se apagam.', 59.9, 12),
('9786558380764', '8', 'Fantasia', 'Good Omens', 'A hilariante história de um anjo e um demônio que, relutantemente, se unem para evitar o apocalipse, desencadeando uma comédia celestial cheia de sarcasmo, ironia e um toque de humanidade.', 99.9, 16);


INSERT INTO pedido_livro (ISBN, id_pedido, QTD_pedido)
VALUES
('9788532523051', 'A1', 1),
('9786555321449', 'B1', 2),
('9788555340949', 'B1', 4),
('9788594541833', 'C1', 2),
('9788573516531', 'C1', 2),
('9788560280940', 'C1', 1),
('9788525417350', 'D1', 7),
('9788544001820', 'E1', 3),
('9788535933925', 'E1', 4),
('9788560280940', 'F1', 8),
('9788525065377', 'G1', 7),
('9786586799156', 'G1', 7),
('9786584956193', 'H1', 1),
('9788525417350', 'H1', 4),
('9788545709619', 'H1', 11),
('9788545709619', 'I1', 6),
('9788594541833', 'J1', 7),
('9788594541475', 'J1', 2),
('9786559827565', 'K1', 7),
('9786558380542', 'K1', 6),
('9788532523051', 'L1', 10),
('9788535933925', 'M1', 4),
('9788565859516', 'M1', 1),
('9788544001820', 'N1', 1),
('9786558380542', 'O1', 2),
('9786558380542', 'P1', 4),
('9788555340949', 'P1', 8),
('9786589912439', 'Q1', 1),
('9788595084742', 'R1', 3),
('9786555321449', 'R1', 2),
('9786559827565', 'S1', 8),
('9788545709619', 'S1', 7),
('9786586799156', 'S1', 6),
('9788532523051', 'T1', 4),
('9788580575392', 'U1', 1),
('9788594541833', 'U1', 10),
('9788594541475', 'U1', 9),
('9788525417350', 'V1', 1),
('9788525065377', 'V1', 7),
('9788556511348', 'W1', 4),
('9788565859516', 'X1', 5),
('9788555340949', 'X1', 6),
('9786559827565', 'X1', 7),
('9786558380542', 'X1', 4),
('9788535933925', 'Y1', 2),
('9788532505705', 'Z1', 1);

INSERT INTO autor (id_autor, nome_autor, contato_autor, email_autor)
VALUES
('A2', 'J. K. Rowling', 'info@jkrowling.com', 'jrowling@scholastic.com'),
('B2', 'Rick Riordan', 'instagram.com/rickriordan', 'rriordan@gmail.com'),
('C2', 'Joe Abercrombie', 'instagram.com/joeabercrombie', 'joeaber@gmail.com'),
('D2', 'Tori Telfer', 'instagram.com/tori__telfer', 'toritelfer@gmail.com'),
('E2', 'Taylor Jenkins Reid', 'instagram.com/tjenkinsreid', 'taylorjenkinsreid.com'),
('F2', 'Stephen King', 'twitter.com/stephenking', 'stephenking.com'),
('G2', 'Jefferson Ferreira', 'twitter.com/PandaDeCapa', 'jferreira@gmail.com'),
('H2', 'Neil Gaiman', 'mheifetz@writershouse.com', 'neilgaiman.com'),
('I2', 'J. R. R. Tolkien', 'americantolkiensociety@yahoo.com', 'americantolkiensociety.org'),
('J2', 'Suzanne Collins', 'instagram.com/suzannecollinsofficial', 'suzannecollinsbooks.com'),
('K2', 'Jane Austen', 'instagram.com/janeaustenoficial', 'janeausten@inspirationtrust.org'),
('L2', 'Yuval Noah Harari', 'twitter.com/harari_yuval', 'ynharari.com'),
('M2', 'Emma Marriott', 'twitter.com/EmmaMarriott6', 'marriott-emma@sky.com'),
('N2', 'Casey McQuiston', 'instagram.com/casey.mcquiston/', 'caseymcquinston.com'),
('O2', 'Tatsuya Endou', 'twitter.com/_tatsuyaendo_', 'tendou@gmail.com'),
('P2', 'Matt Haig', 'instagram.com/mattzhaig', 'hello@matthaig.com'),
('Q2', 'Nicolau Maquiavel', 'instagram.com/maquiavelfilosofo', '—'),
('R2', 'Friedrich Nietzsche', 'twitter.com/nietzsche_oficial', '—'),
('S2', 'Inio Asano', 'instagram.com/asano_inio', '—'),
('T2', 'Vitor Martins', 'instagram.com/vitormrtns', 'vitormartins.blog'),
('U2', 'Roy Wenzl', 'twitter.com/RoyWenzl', 'roywenzl.com'),
('V2', 'Terry Pratchett', 'terrypratchettbooks.com', 'discworld@penguinrandomhouse.co.uk');


INSERT INTO livro_autor (ISBN, id_autor, publicação, edição)
VALUES
('9788532523051', 'A2', '1997', '6'),
('9788532505705', 'A2', '2017', '1'),
('9788551008881', 'B2', '2024', '1'),
('9788580575392', 'B2', '2005', '2'),
('9788594541833', 'U2', '2019', '1'),
('9788594541475', 'D2', '2017', '1'),
('9788584391400', 'E2', '2019', '1'),
('9788584391509', 'E2', '2017', '2'),
('9788560280940', 'F2', '1986', '5'),
('9788556511348', 'F2', '1974', '3'),
('9788551006757', 'H2', '2002', '2'),
('9788573516531', 'H2', '1989', '2'),
('9786555112511', 'I2', '2023', '1'),
('9788595084742', 'I2', '2019', '1'),
('9786555321449', 'J2', '2008', '2'),
('9786587435916', 'K2', '2022', '1'),
('9788544001820', 'K2', '2021', '2'),
('9788535933925', 'L2', '2011', '1'),
('9788565859516', 'M2', '2014', '1'),
('9788555340949', 'N2', '2020', '1'),
('9786559827565', 'O2', '2019', '1'),
('9786558380542', 'P2', '2004', '8'),
('9786584956193', 'Q2', '2023', '1'),
('9788525417350', 'R2', '2019', '1'),
('9788545709619', 'S2', '2007', '2'),
('9788525065377', 'T2', '2018', '2'),
('9786586799156', 'C2', '2020', '1'),
('9786589912439', 'F2', '2021', '1'),
('9786589912439', 'H2', '2021', '1'),
('9786558380764', 'H2', '2022', '1'),
('9786558380764', 'V2', '2022', '1');

/*PESQUISAS*/

-- 1. Lista de clientes com a contagem de pedidos:
CREATE VIEW view_clientes_pedidos AS
SELECT c.Nome_cliente, COUNT(p.id_pedido) AS total_pedidos
FROM cliente c
LEFT JOIN pedido p USING (id_cliente)
GROUP BY c.id_cliente;

-- 2. Livros mais vendidos:
CREATE VIEW view_livros_mais_vendidos AS
SELECT l.título, SUM(pl.QTD_pedido) AS total_vendido
FROM livro l
JOIN pedido_livro pl USING (ISBN)
GROUP BY l.ISBN
ORDER BY total_vendido DESC;

-- 3. Quantidade de livros vendidos por autor:
CREATE VIEW view_livros_por_autor AS
SELECT a.nome_autor, SUM(pl.QTD_pedido) AS total_livros
FROM autor a
JOIN livro_autor la USING (id_autor)
JOIN livro l USING (ISBN)
JOIN pedido_livro pl USING (ISBN)
GROUP BY a.id_autor
ORDER BY total_livros DESC;

-- 4. Livros que têm mais de um autor:
CREATE VIEW view_livros_mais_autores AS
SELECT l.título AS titulo_livro, GROUP_CONCAT(a.nome_autor) AS nomes_autores
FROM livro l
JOIN livro_autor la USING (ISBN)
JOIN autor a USING (id_autor)
GROUP BY l.título, l.ISBN
HAVING COUNT(a.id_autor) > 1;

-- 5. Ganho Total:
CREATE VIEW view_ganho_total AS
SELECT SUM(p.Preço_pedido) AS soma_total
FROM pedido p;

-- 6. Autores que escreveram mais de um gênero:
CREATE VIEW view_autores_mais_generos AS
SELECT a.id_autor, a.nome_autor, COUNT(DISTINCT l.gênero) AS num_generos
FROM autor a
JOIN livro_autor la USING (id_autor)
JOIN livro l USING (ISBN)
GROUP BY a.id_autor
HAVING COUNT(DISTINCT l.gênero) > 1;

-- 7. Lista os fornecedores em ordem alfabética com seus respectivos títulos:
CREATE VIEW view_fornecedores_titulos AS
SELECT f.nome_fornecedor, l.título
FROM fornecedor f JOIN livro l USING (id_fornecedor)
ORDER BY f.nome_fornecedor ASC;

-- 8. Quantos livros cada autor vendeu:
CREATE VIEW view_quantidade_livros_por_autor AS
SELECT a.nome_autor, COUNT(l.ISBN) AS total_livros
FROM autor a
JOIN livro_autor la USING (id_autor)
JOIN livro l USING (ISBN)
GROUP BY a.id_autor
ORDER BY total_livros DESC;

-- 9. Gêneros que começam com 'F', em ordem alfabética:
CREATE VIEW view_generos_inicio_F AS
SELECT DISTINCT gênero
FROM livro
WHERE gênero LIKE 'F%'
ORDER BY gênero;

-- 10. Valor total gasto em cada tipo de pagamento:
CREATE VIEW view_valor_total_pagamento AS
SELECT forma_pagamento, SUM(Preço_pedido) AS receita_total
FROM pedido
GROUP BY forma_pagamento;


SELECT * FROM view_clientes_pedidos;

SELECT * FROM view_livros_mais_vendidos;

SELECT * FROM view_livros_por_autor;

SELECT * FROM view_livros_mais_autores;

SELECT * FROM view_ganho_total;

SELECT * FROM view_autores_mais_generos;

SELECT * FROM view_fornecedores_titulos;

SELECT * FROM view_quantidade_livros_por_autor;

SELECT * FROM view_generos_inicio_F;

SELECT * FROM view_valor_total_pagamento;























