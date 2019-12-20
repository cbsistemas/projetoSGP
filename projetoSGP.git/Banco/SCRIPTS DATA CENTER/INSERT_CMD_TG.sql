CREATE TRIGGER receber_cmd_tg
  AFTER INSERT OR UPDATE OR DELETE
  ON receber
  FOR EACH ROW
  EXECUTE PROCEDURE add_comando_sincronizar();