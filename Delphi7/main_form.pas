unit main_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, engine, form_switcher;

type

  { TMainForm }

  TMainForm = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    ListBox1: TListBox;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ListBox1KeyPress(Sender: TObject; var Key: char);
  public
    procedure Init;
  end;

implementation

{$R *.dfm}

{ TMainForm }

procedure TMainForm.Init;
begin
  ListBox1.Items := _game;
  StatusBar1.SimpleText := '��������� ' + IntToStr(_data.Count) + ' ����.';
end;

procedure TMainForm.Button1Click(Sender: TObject);
var s, ss: string; num, t: integer;

procedure addWord(info: TCharSrchInfo; n: integer);
var i: integer;
begin
  i := 0;
  with info do
  repeat
    s := _data[start+Random(count)];
    inc(i);
    if i = 10 then
      begin
        for i:=1 to info.count do
        begin
          s := _data[start+i-1];
          if not _gameS.Find(s, t) then
            break;
        end;
        if _gameS.Find(s, t) then
        begin
          StatusBar1.SimpleText := '�� �������� 8|';
          exit;
        end;
        break;
      end;
  until not _gameS.Find(s, t);
  ListBox1.Items.Insert(n, s);
  _game.Insert(n, s);
  _gameS.Add(s);
end;

begin
  s := Trim(LowerCase(Edit1.Text));
  num := _game.Count;
  if not isWord(s) then
    StatusBar1.SimpleText := '�� ����� �� �����!'
  else
  if not _data.Find(s, t) then
    StatusBar1.SimpleText := '����� ���� � �������!'
  else
  if num = 0 then
    begin
      Edit1.Text := '';
      ListBox1.Items.Insert(num, s);
      _game.Insert(num, s);
      _gameS.Add(s);
    end
  else
    begin
      ss := _game[num-1];
      if LastLetter(ss) <> s[1] then
        StatusBar1.SimpleText := '����� ���������� �� �� �� �����!'
      else
      if _gameS.Find(s, t) then
        StatusBar1.SimpleText := '����� ��� � ����!'
      else
        begin
          StatusBar1.SimpleText := '';
          Edit1.Text := '';
          ListBox1.Items.Insert(num, s);
          _game.Insert(num, s);
          _gameS.Add(s);
        end
    end;
  if num <> _game.Count then
    addWord(_chInfo[ord(LastLetter(s))], num+1);
  ListBox1.ItemIndex := ListBox1.Items.Count-1;
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
  _show := not _show;
  Button1.Enabled := not Button1.Enabled;
  if _show then
    begin
      ListBox1.Items := _data;
      Button2.Caption := '�������� �������';
    end
  else
    begin
      ListBox1.Items := _game;
      Button2.Caption := '�������� �������';
    end;
end;

procedure TMainForm.Button3Click(Sender: TObject);
begin
  FormSwitcher.SwitchTo(self, 'start');
end;

procedure TMainForm.Edit1KeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
    Button1Click(Sender);
end;

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  FormSwitcher.SwitchTo(self, 'start');
  _dbreload := True;
end;

procedure TMainForm.ListBox1DblClick(Sender: TObject);
begin
  Edit1.Text := ListBox1.Items[ListBox1.ItemIndex];
end;

procedure TMainForm.ListBox1KeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
    Edit1.Text := ListBox1.Items[ListBox1.ItemIndex];
end;

end.