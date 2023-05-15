/* 1) Escreva comandos SQL para inserir os dados abaixo conforme o diagrama
      apresentado.
            a) Pablo é Pai de Lucas
            b) Brenda é Mãe de Lucas
*/

INSERT INTO aluno (id, nome) VALUES (1, 'Lucas');

INSERT INTO responsavel (id, nome) VALUES (1, 'Pablo');

INSERT INTO parentesco (idResponsavel, idAluno, parentesco) VALUES (1, 1, 'Pai');

INSERT INTO responsavel (id, nome) VALUES (2, 'Brenda');

INSERT INTO parentesco (idResponsavel, idAluno, parentesco) VALUES (2, 1, 'Mãe');

-- Como eu não havia conhecimento de como o campo id era incrementado, optei por incrementar ele manualmente.

/* 2) Escreva uma consulta SQL para retornar dados únicos conforme tabela abaixo.
      Caso o aluno tenha mais de dois responsáveis, traga apenas os dois primeiros
      responsáveis encontrados na tabela.
*/

SELECT a.nome AS Aluno, 
       r1.nome AS Responsavel, 
       p1.parentesco AS Parentesco, 
       r2.nome AS Responsavel, 
       p2.parentesco AS Parentesco
FROM aluno a
INNER JOIN parentesco p1 ON a.id = p1.idAluno AND p1.idResponsavel = (
    SELECT MIN(idResponsavel) 
    FROM parentesco p 
    WHERE p.idAluno = a.id
)
INNER JOIN responsavel r1 ON r1.id = p1.idResponsavel
INNER JOIN parentesco p2 ON a.id = p2.idAluno AND p2.idResponsavel = (
    SELECT MIN(idResponsavel) 
    FROM parentesco p 
    WHERE p.idAluno = a.id AND p.idResponsavel > p1.idResponsavel
)
INNER JOIN responsavel r2 ON r2.id = p2.idResponsavel;


-- Bonus 1) Escreva uma consulta SQL para trazer todos os dados. Seja criativo.

SELECT 
  aluno.nome AS aluno,
  responsavel.nome AS responsavel,
  parentesco.parentesco,
  responsavel.id
FROM 
  aluno 
  INNER JOIN parentesco ON aluno.id = parentesco.idAluno
  INNER JOIN responsavel ON parentesco.idResponsavel = responsavel.id
WHERE 
  aluno.nome LIKE '%Luca%' AND parentesco.parentesco = 'Pai';



