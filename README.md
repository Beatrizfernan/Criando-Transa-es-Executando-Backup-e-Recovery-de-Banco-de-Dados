# **Projeto SQL - Transações, Backup e Recovery**

Este projeto tem como objetivo demonstrar o uso de transações em banco de dados MySQL, bem como a execução de backup e recovery de banco de dados utilizando o utilitário mysqldump.

## **Parte 1 – Transações**

Nesta parte, abordamos o conceito de transações em bancos de dados. Uma transação é uma sequência de operações executadas como uma única unidade de trabalho, que deve ser executada de forma completa e consistente. Este é um exemplo básico de como executar uma transação sem o uso de procedimentos armazenados:

```sql
sqlCopy code
START TRANSACTION;
SET autocommit=0;

-- Incluir aqui as instruções SQL para realizar a transação

COMMIT;
ROLLBACK;

```

## **Parte 2 – Transação com Procedure**

Nesta parte, criamos uma procedure para encapsular uma transação mais complexa. As procedures são estruturas que permitem agrupar um conjunto de instruções SQL em um único bloco executável. Aqui está um exemplo de como criar e chamar uma procedure que executa uma transação:

```sql
sqlCopy code
DELIMITER //
CREATE PROCEDURE nome_procedure()
BEGIN
    DECLARE erro INT DEFAULT 0;

    -- Incluir aqui as instruções SQL para realizar a transação

    IF erro = 1 THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END //
DELIMITER ;

CALL nome_procedure();

```

## **Parte 3 – Backup e Recovery**

Nesta parte, exploramos o processo de backup e recovery de um banco de dados MySQL utilizando o utilitário mysqldump. O mysqldump é uma ferramenta de linha de comando que permite fazer cópias de segurança lógica dos dados de um banco de dados MySQL. Aqui estão os comandos básicos para executar um backup e restore do banco de dados:

```bash
bashCopy code
# Backup
mysqldump -u [usuario] -p[senha] [banco_de_dados] > backup.sql

# Restore
mysql -u [usuario] -p[senha] [banco_de_dados] < backup.sql

```

---

Este README fornece uma visão geral do projeto e instruções básicas para executar as operações de transação, bem como backup e restore do banco de dados. Sinta-se à vontade para adaptá-lo conforme necessário para seu projeto específico.

Espero que isso ajude! Se precisar de mais alguma coisa, estou à disposição.
