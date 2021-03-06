unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCalendars, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.WinXPickers;

type
  TEraTest = class(TForm)
    Button1: TButton;
    edtFormatDateTime1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtFormatSettings: TEdit;
    DateTimePicker1: TDateTimePicker;
    procedure Button1Click(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  EraTest: TEraTest;

implementation

{$R *.dfm}

procedure TEraTest.Button1Click(Sender: TObject);
var
  // 書式
  eraFormat : TFormatSettings;
  s : string;
begin

  // 書式を指定して変換をする
  DateTimeToString(s, 'ggee年mm月dd日', DateTimePicker1.Date);
  edtFormatDateTime1.Text := s;

  // 地域情報を取得して変換をする
  {$WARN SYMBOL_PLATFORM OFF}
  eraFormat := TFormatSettings.Create(TLanguages.UserDefaultLocale);
  edtFormatSettings.Text := FormatDateTime(eraFormat.LongDateFormat, DateTimePicker1.Date);
end;

end.
