unit uContador;

interface

uses System.Classes, System.SysUtils;

type
  TContador = class(TThread)
  protected
    procedure Execute; override;
    procedure Contador;
end;

implementation

{ TContador }

uses untTotalizadores;

procedure TContador.Contador;
begin
  Priority := tpLower;
  Inc(Tempo);
  Inc(Tempo);
  frmTotalizadores.pgbProgresso.Percent := Tempo;
  if (Tempo>=100) then
  begin
    Tempo:=0;
  end;
  Sleep (10);

  if self.Terminated then
    abort
  else
    Contador;
end;

procedure TContador.Execute;
begin
  Contador;

  inherited;

end;

end.
