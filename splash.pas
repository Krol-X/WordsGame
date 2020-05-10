unit splash;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  mmsystem, windows;

type

  { TSplashForm }

  TSplashForm = class(TForm)
    ProgressBar1: TProgressBar;
  private
  public
  end;

var
  SplashForm: TSplashForm;

implementation

{$R *.lfm}

{ TSplashForm }

end.

