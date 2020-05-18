program words;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, start_form, main_form, form_switcher;

{$R *.res}

var
  MainForm: TMainForm;
  StartForm: TStartForm;

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TStartForm, StartForm);
  Application.CreateForm(TMainForm, MainForm);
  FormSwitcher := TFormSwitcher.Create;
  FormSwitcher.AddForm(StartForm, 'start');
  FormSwitcher.AddForm(MainForm, 'main');
  Application.Run;
end.

