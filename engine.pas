unit engine;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ComCtrls, RegExpr;

var
  _data: TStringList;  // Словарь
  _game: TStringList;  // Текущая игра
  _gameS: TStringList; // Сортированный список для поиска
  _show: boolean;      // Показываем ли мы словарь?

function isWord(s: string): boolean;

procedure Init;
procedure LoadData(mask: string; splash: TForm);
procedure Done;

implementation

function isWord(s: string): boolean;
begin
  with TRegExpr.Create do
    try
      Expression := '[а-я]';
      Result := Exec(s);
    finally
      Free;
    end;
end;

procedure Init;
begin
  _data := TStringList.Create;
  _game  := TStringList.Create;
  _gameS := TStringList.Create;
  _gameS.Sorted := True;
end;

procedure LoadData(mask: string; splash: TForm);
var sr: TSearchRec; dir, tmp: TStringList; i: integer;
begin
  dir := TStringList.Create;
  tmp := TStringList.Create;

  If FindFirst(mask, faAnyFile, sr) = 0 then
    repeat
      dir.Add(sr.Name);
    until FindNext(sr) <> 0;
  FindClose(sr);

  for i:=1 to dir.Count do
  begin
    splash.Caption := 'Игра в слова! Загрузка "' + dir[i-1] + '"...';
    TProgressBar(splash.Controls[0]).Position := round(i/dir.Count*100);
    tmp.LoadFromFile(dir[i-1]);
    _data.AddStrings(tmp);
  end;
  _data.Sorted := True;

  dir.Destroy;
  tmp.Destroy;
end;

procedure Done;
begin
  _data.Destroy;
  _game.Destroy;
  _gameS.Destroy
end;

end.

