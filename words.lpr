program words;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, main, splash, engine;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  try
    Application.Scaled:=True;
    Application.Initialize;
    SplashForm:=TSplashForm.Create(Application);
    SplashForm.Show;
    Application.CreateForm(TMainForm, MainForm);
    MainForm.Init;
    LoadData('*.dat', SplashForm);
    SplashForm.Hide;
  finally
    SplashForm.Close;
  end;
  Application.Run;
end.

