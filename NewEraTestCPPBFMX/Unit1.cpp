//---------------------------------------------------------------------------

#include <fmx.h>
#include <memory>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
#pragma resource ("*.Windows.fmx", _PLAT_MSWINDOWS)

TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
	TFormatSettings LocaleSettings = TFormatSettings::Create(TLanguages::UserDefaultLocale);

	// 元号一覧の取得
	cboEra->Items->Clear();
	for (auto era : LocaleSettings.EraInfo) {
		cboEra->Items->Add(era.EraName);
	}
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
	TFormatSettings LocaleSettings = TFormatSettings::Create(TLanguages::UserDefaultLocale);

	LocaleSettings.ShortDateFormat = "ggee/m/d";
	std::unique_ptr<TStringBuilder> psbYMD(new TStringBuilder());


	// 選択値を「ggee/m/d」の形式で文字列化
	psbYMD->Append(cboEra->Items->Strings[cboEra->ItemIndex]);
	psbYMD->Append(edtYear->Text);
	psbYMD->Append("/");
	psbYMD->Append(edtMonth->Text);
	psbYMD->Append("/");
	psbYMD->Append(edtDay->Text);

    // 和暦から西暦に変換
	TDateTime dd = StrToDate(psbYMD->ToString(), LocaleSettings);
	Edit1->Text = DateTimeToStr(dd);
}
//---------------------------------------------------------------------------

