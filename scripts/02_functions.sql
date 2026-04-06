-- Triggers / Funções

--Trigger que bloqueia o empréstimo do mesmo livro duas vezes
CREATE OR REPLACE FUNCTION bloquear_emprestimo()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM emprestimo
        WHERE livro_id = NEW.livro_id
        AND data_devolucao IS NULL
    ) THEN
        RAISE EXCEPTION 'Este livro já está emprestado!';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_bloquear_emprestimo
BEFORE INSERT ON emprestimo
FOR EACH ROW
EXECUTE FUNCTION bloquear_emprestimo();