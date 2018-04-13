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
    { Private éŒ¾ }
  public
    { Public éŒ¾ }
  end;

var
  EraTest: TEraTest;

implementation

{$R *.dfm}

procedure TEraTest.Button1Click(Sender: TObject);
var
  // ‘®
  eraFormat : TFormatSettings;
  s : string;
begin

  // ‘®‚ğw’è‚µ‚Ä•ÏŠ·‚ğ‚·‚é
  DateTimeToString(s, 'ggee”NmmŒdd“ú', DateTimePicker1.Date);
  edtFormatDateTime1.Text := s;

  // ’nˆæî•ñ‚ğæ“¾‚µ‚Ä•ÏŠ·‚ğ‚·‚é
  {$WARN SYMBOL_PLATFORM OFF}
  eraFormat := TFormatSettings.Create(TLanguages.UserDefaultLocale);
  edtFormatSettings.Text := FormatDateTime(eraFormat.LongDateFormat, DateTimePicker1.Date);
end;

end.
