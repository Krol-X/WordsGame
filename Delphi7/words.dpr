program words;

uses
  Forms,
  start_form in 'start_form.pas' {StartForm},
  form_switcher in 'form_switcher.pas',
  main_form in 'main_form.pas' {MainForm},
  engine in 'engine.pas';

{$R *.res}

var
  MainForm: TMainForm;
  StartForm: TStartForm;

begin
  Application.Initialize;
  Application.CreateForm(TStartForm, StartForm);
  Application.CreateForm(TMainForm, MainForm);
  FormSwitcher := TFormSwitcher.Create;
  FormSwitcher.AddForm(StartForm, 'start');
  FormSwitcher.AddForm(MainForm, 'main');
  Application.Run;
  FormSwitcher.Destroy;
end.
