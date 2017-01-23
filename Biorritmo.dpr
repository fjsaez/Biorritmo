program Biorritmo;

uses
  Forms,
  Principal in 'Principal.pas' {FPrinc};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Calculadora de Biorritmo';
  Application.CreateForm(TFPrinc, FPrinc);
  Application.Run;
end.
