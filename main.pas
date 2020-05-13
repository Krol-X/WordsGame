unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, engine;

type

  { TMainForm }

  TMainForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    ListBox1: TListBox;
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ListBox1KeyPress(Sender: TObject; var Key: char);
  private
  public
    procedure Init;
  end;

var
  MainForm: TMainForm;

implementation

{$R main.lfm}

{ TMainForm }

procedure TMainForm.Init;
begin
  engine.Init;
  ListBox1.Items := _game;
  StatusBar1.SimpleText := 'Загружено ' + IntToStr(_data.Count) + ' слов.';
end;

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  engine.Done;
end;



function LastLetter(s: string): char;
var i: integer;
begin
  i := s.Length;
  if i = 0 then
    Result := #0
  else
  if pos(s[i], #138#139#140) <> 0 then
    Result := s[i-2]
  else
    Result := s[i];
end;

procedure TMainForm.Button1Click(Sender: TObject);
var s, ss: string; num, t: integer;
begin
  s := LowerCase(Edit1.Text).Trim;
  num := _game.Count;
  if not isWord(s) then
    StatusBar1.SimpleText := 'Вы ввели не слово!'
  else
  if not _data.Find(s, t) then
    StatusBar1.SimpleText := 'Слова нету в словаре!'
  else
  if num = 0 then
    begin
      ListBox1.Items.Insert(num, s);
      _game.Insert(num, s);
      _gameS.Add(s);
    end
  else
    begin
      ss := _game[num-1];
      if LastLetter(ss) <> s[2] then
        StatusBar1.SimpleText := 'Слово начинается не на ту букву!'
      else
      if _gameS.Find(s, t) then
        StatusBar1.SimpleText := 'Слово уже в игре!'
      else
        begin
          StatusBar1.SimpleText := '';
          ListBox1.Items.Insert(num, s);
          _game.Insert(num, s);
          _gameS.Add(s);
        end
    end;
  if num <> _game.Count then
    with _chInfo[ord(s[s.Length])] do
      begin
        s := _data[start+Random(count)];
        ListBox1.Items.Insert(num+1, s);
        _game.Insert(num+1, s);
        _gameS.Add(s);
      end;
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
  _show := not _show;
  Button1.Enabled := not Button1.Enabled;
  if _show then
    begin
      ListBox1.Items := _data;
      Button2.Caption := 'Спрятать словарь';
    end
  else
    begin
      ListBox1.Items := _game;
      Button2.Caption := 'Показать словарь';
    end;
end;

procedure TMainForm.Button3Click(Sender: TObject);
begin
  MainForm.Close;
end;

procedure TMainForm.Edit1KeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
    Button1Click(Sender);
end;

procedure TMainForm.ListBox1DblClick(Sender: TObject);
begin
  Edit1.Text := ListBox1.GetSelectedText;
end;

procedure TMainForm.ListBox1KeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
    Edit1.Text := ListBox1.GetSelectedText;
end;

end.

