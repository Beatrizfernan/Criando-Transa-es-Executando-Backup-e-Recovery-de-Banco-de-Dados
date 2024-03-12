-- PARTE 1 – TRANSAÇÕES

-- Iniciar uma transação e desabilitar autocommit
START TRANSACTION;
SET autocommit=0;

-- Exemplo de transação: seleção de uma linha para atualização e atualização da linha
SELECT * FROM tabela WHERE coluna = valor FOR UPDATE;
UPDATE tabela SET coluna = novo_valor WHERE coluna = valor;

-- Confirmar a transação
COMMIT;

-- Desfazer a transação (rollback)
ROLLBACK;

-- PARTE 2 - TRANSAÇÃO COM PROCEDURE

-- Criar uma procedure para execução da transação
DELIMITER //
CREATE PROCEDURE nome_procedure()
BEGIN
    DECLARE erro INT DEFAULT 0;
    
    -- Iniciar uma transação e desabilitar autocommit
    START TRANSACTION;
    SET autocommit=0;
    
    -- Incluir aqui as instruções SQL para realizar a transação
    
    -- Exemplo: 
    -- IF condição THEN
    --     SET erro = 1;
    -- END IF;
    
    -- Verificar se houve erro e realizar rollback ou commit
    IF erro = 1 THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END //
DELIMITER ;

-- Chamar a procedure para executar a transação
CALL nome_procedure();

-- PARTE 3 – BACKUP E RECOVERY

-- Executar backup do banco de dados usando mysqldump
-- Exemplo:
-- mysqldump -u [usuario] -p[senha] [banco_de_dados] > backup.sql

-- Restaurar backup do banco de dados
-- Exemplo:
-- mysql -u [usuario] -p[senha] [banco_de_dados] < backup.sql
