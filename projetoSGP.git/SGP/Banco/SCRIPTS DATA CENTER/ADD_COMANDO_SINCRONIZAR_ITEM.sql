CREATE OR REPLACE FUNCTION add_comando_sincronizar_item() RETURNS TRIGGER AS
$$
DECLARE
	idFl integer;
	idPai integer;
BEGIN

        IF TG_OP <> 'DELETE' THEN
		IF TG_RELNAME =  'mov_int_itens' THEN
			idPai = NEW.IDMOV;
		ELSE
			IF TG_RELNAME =  'pedido_item' THEN
				idPai = NEW.IDPEDIDO;
			ELSE
				IF TG_RELNAME =  'romaneio_item' THEN
					idPai = NEW.IDROMANEIO;
				ELSE
					IF TG_RELNAME =  'venda_item' THEN				
						idPai = NEW.IDVENDA;
					END IF;		       
				END IF;	       
			END IF;       
		END IF;
	ELSE
		IF TG_RELNAME =  'mov_int_itens' THEN
			idPai = OLD.IDMOV;
		ELSE
			IF TG_RELNAME =  'pedido_item' THEN
				idPai = OLD.IDPEDIDO;
			ELSE
				IF TG_RELNAME =  'romaneio_item' THEN
					idPai = OLD.IDROMANEIO;
				ELSE
					IF TG_RELNAME =  'venda_item' THEN				
						idPai = OLD.IDVENDA;
					END IF;		       
				END IF;	       
			END IF;       
		END IF;
	END IF;
	
	FOR idFl in
		SELECT ID FROM FILIAL
	LOOP
		IF TG_OP <> 'DELETE' THEN	    
			INSERT INTO SINCRONIZAR (IDFILIAL, IDFILIAL_PK, IDOPERACAO, TIPO_OPERACAO, TABELA, ITEM) VALUES (idFl, NEW.IDFILIAL, idPai, TG_OP, TG_RELNAME, NEW.ITEM);		    
		ELSE
			INSERT INTO SINCRONIZAR (IDFILIAL, IDFILIAL_PK, IDOPERACAO, TIPO_OPERACAO, TABELA, ITEM) VALUES (idFl, OLD.IDFILIAL, idPai, TG_OP, TG_RELNAME, OLD.ITEM);		    
	        END IF;
	END LOOP; 
	RETURN NEW;      
END;
$$ LANGUAGE 'plpgsql';