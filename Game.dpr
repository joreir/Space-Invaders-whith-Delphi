program Game;

uses
  Vcl.Forms,
  UFPrincipal in 'UFPrincipal.pas' {FrmPrincipal},
  UCnave in 'UCnave.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
