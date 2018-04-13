program NewEraTestDel;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {EraTest};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TEraTest, EraTest);
  Application.Run;
end.
