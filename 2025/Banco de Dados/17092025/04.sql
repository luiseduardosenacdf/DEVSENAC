USE `cap3_tabelas_dados`;

ALTER TABLE comprodu
  ADD CONSTRAINT fk_comprodu_comforne
    FOREIGN KEY (n_numeforne)
    REFERENCES comforne(n_numeforne)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE comvenda
  ADD CONSTRAINT fk_comvenda_comforne
    FOREIGN KEY (n_numeforne)
    REFERENCES comforne(n_numeforne)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE comvenda
  ADD CONSTRAINT fk_comvenda_comvende
    FOREIGN KEY (n_numevende)
    REFERENCES comvende(n_numevende)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE comvenda
  ADD CONSTRAINT fk_comvenda_comclien
    FOREIGN KEY (n_numeclien)
    REFERENCES comclien(n_numeclien)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE comvendas
  ADD CONSTRAINT fk_comvendas_comclien
    FOREIGN KEY (n_numeclien)
    REFERENCES comclien(n_numeclien)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE comvendas
  ADD CONSTRAINT fk_comvendas_comforne
    FOREIGN KEY (n_numeforne)
    REFERENCES comforne(n_numeforne)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE comvendas
  ADD CONSTRAINT fk_comvendas_comvende
    FOREIGN KEY (n_numevende)
    REFERENCES comvende(n_numevende)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE comivenda
  ADD CONSTRAINT fk_comivenda_comprodu
    FOREIGN KEY (n_numeprodu)
    REFERENCES comprodu(n_numeprodu)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE comivenda
  ADD CONSTRAINT fk_comivenda_comvenda
    FOREIGN KEY (n_numevenda)
    REFERENCES comvenda(n_numevenda)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
