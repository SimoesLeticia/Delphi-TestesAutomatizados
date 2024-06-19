unit ufrmPrincipal;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
   Vcl.ExtCtrls, Vcl.Buttons, Vcl.Menus, Vcl.Imaging.pngimage, Vcl.StdCtrls,
   Vcl.ComCtrls, Vcl.ExtDlgs, System.UITypes;

type
   TfrmPrincipal = class(TForm)
      ActionHighlightButton: TMenuItem;
      ActionHighlightPanel: TMenuItem;
      ActionUnhighlightButton: TMenuItem;
      ActionUnhighlightPanel: TMenuItem;
      edt01: TEdit;
      img01: TImage;
      img02: TImage;
      img03: TImage;
      img04: TImage;
      img05: TImage;
      lbl01: TLabel;
      lbl02: TLabel;
      lbl03: TLabel;
      lbl04: TLabel;
      lbl05: TLabel;
      lbl06: TLabel;
      lbl07: TLabel;
      lbl08: TLabel;
      lbl09: TLabel;
      lbl10: TLabel;
      lbl11: TLabel;
      lblAVG: TLabel;
      lblMAX: TLabel;
      lblMED: TLabel;
      lblMIN: TLabel;
      lblMOD: TLabel;
      lblRNG: TLabel;
      lblSTD: TLabel;
      lblSUM: TLabel;
      lblTitle: TLabel;
      lblVAR: TLabel;
      OpenDialog: TOpenDialog;
      pnl01_01: TPanel;
      pnl01_02: TPanel;
      pnl01_03_01: TPanel;
      pnl01_03_02: TPanel;
      pnl01_03_03: TPanel;
      pnl01_03_04: TPanel;
      pnl01_03_05: TPanel;
      pnl01_03_06: TPanel;
      pnl01_03_07: TPanel;
      pnl01_03_08: TPanel;
      pnl01_03_09: TPanel;
      pnl01_03_10: TPanel;
      pnl01_03: TPanel;
      pnl01: TPanel;
      pnl02_01: TPanel;
      pnl02_02: TPanel;
      pnl02_03: TPanel;
      pnl02_04: TPanel;
      pnl02: TPanel;
      pnlGerar: TPanel;
      popMenu: TPopupMenu;
      shp01: TShape;
      shp02: TShape;
      shp03: TShape;
      shp04: TShape;
      shp05: TShape;
      shp06: TShape;
      shp07: TShape;
      shp08: TShape;
      shp09: TShape;
      procedure ActionHighlightButtonClick(Sender: TObject);
      procedure ActionHighlightPanelClick(Sender: TObject);
      procedure ActionUnhighlightButtonClick(Sender: TObject);
      procedure ActionUnhighlightPanelClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure img01Click(Sender: TObject);
      procedure img02Click(Sender: TObject);
      procedure img03Click(Sender: TObject);
      procedure img04Click(Sender: TObject);
      procedure img05Click(Sender: TObject);
      procedure pnlGerarClick(Sender: TObject);
   private
      { Private declarations }
      procedure ChangePanelColor(Panel: TPanel; Enter: Boolean);
      procedure GerarRelatorio(CaminhoArquivo: String);
   public
      { Public declarations }
   end;

var
   frmPrincipal: TfrmPrincipal;

implementation

Uses
   uStatistics, ufrmSobre;

{$R *.dfm}

procedure TfrmPrincipal.ActionHighlightButtonClick(Sender: TObject);
var
   ParentPanel: TComponent;
begin
   if Sender is TImage then
   begin
      ParentPanel := TImage(Sender).GetParentComponent;
      if Assigned(ParentPanel) and (ParentPanel is TPanel) then
         ChangePanelColor(TPanel(ParentPanel), True);
   end;
end;

procedure TfrmPrincipal.ActionHighlightPanelClick(Sender: TObject);
begin
   if Sender is TPanel then
      ChangePanelColor(TPanel(Sender), True);
end;

procedure TfrmPrincipal.ActionUnhighlightButtonClick(Sender: TObject);
var
   ParentPanel: TComponent;
begin
   if Sender is TImage then
   begin
      ParentPanel := TImage(Sender).GetParentComponent;
      if Assigned(ParentPanel) and (ParentPanel is TPanel) then
         ChangePanelColor(TPanel(ParentPanel), False);
   end;
end;

procedure TfrmPrincipal.ActionUnhighlightPanelClick(Sender: TObject);
begin
   if Sender is TPanel then
      ChangePanelColor(TPanel(Sender), False);
end;

procedure TfrmPrincipal.ChangePanelColor(Panel: TPanel; Enter: Boolean);
begin
   if Enter then
      Panel.Color := $002B231E
   else
      Panel.Color := $0016120F;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   pnl01_01.SetFocus;
end;

procedure TfrmPrincipal.GerarRelatorio(CaminhoArquivo: String);
var
   Relatorio: TStringList;
   ListaOriginal: String;
begin
   Relatorio := TStringList.Create;

   ListaOriginal := '[' + StringReplace(edt01.Text, ' ', EmptyStr,
     [rfReplaceAll]) + ']';

   try
      Relatorio.Add('--------------------------------------------------');
      Relatorio.Add('              QuickStats - Relat�rio');
      Relatorio.Add('--------------------------------------------------');
      Relatorio.Add('');
      Relatorio.Add('1. Lista Original:');
      Relatorio.Add('   ' + ListaOriginal);
      Relatorio.Add('');
      Relatorio.Add('--------------------------------------------------');
      Relatorio.Add('         QuickStats: Estat�sticas B�sicas');
      Relatorio.Add('--------------------------------------------------');
      Relatorio.Add('');
      Relatorio.Add('- M�dia..............: ' + lblAVG.Caption);
      Relatorio.Add('- Moda...............: ' + lblMOD.Caption);
      Relatorio.Add('- Mediana............: ' + lblMED.Caption);
      Relatorio.Add('- Vari�ncia..........: ' + lblVAR.Caption);
      Relatorio.Add('- Desvio Padr�o......: ' + lblSTD.Caption);
      Relatorio.Add('- Amplitude..........: ' + lblRNG.Caption);
      Relatorio.Add('- Valor M�nimo.......: ' + lblMIN.Caption);
      Relatorio.Add('- Valor M�ximo.......: ' + lblMAX.Caption);
      Relatorio.Add('- Somat�rio..........: ' + lblSUM.Caption);
      Relatorio.Add('');
      Relatorio.Add('--------------------------------------------------');
      Relatorio.Add('');

      try
         Relatorio.SaveToFile(CaminhoArquivo);
      except
         MessageDlg
           ('Ocorreu um erro ao salvar o relat�rio. Por favor, verifique e tente novamente.',
           mtError, [mbOK], 0);
         Exit;
      end;
   finally
      MessageDlg
        ('Relat�rio gerado com sucesso! Confira no diret�rio especificado.',
        mtConfirmation, [mbOK], 0);

      Relatorio.Free;
   end;
end;

procedure TfrmPrincipal.img01Click(Sender: TObject);
begin
   MessageDlg('Legenda das Estat�sticas:' + sLineBreak + sLineBreak +
     '- M�dia: Valor m�dio dos n�meros na lista.' + sLineBreak +
     '- Moda: Valor mais frequente na lista.' + sLineBreak +
     '- Mediana: Valor do meio na lista ordenada.' + sLineBreak +
     '- Vari�ncia: Medida de dispers�o dos n�meros.' + sLineBreak +
     '- Desvio Padr�o: Medida de dispers�o em torno da m�dia.' + sLineBreak +
     '- Amplitude: Diferen�a entre o maior e o menor valor.' + sLineBreak +
     '- M�nimo: Menor valor na lista.' + sLineBreak +
     '- M�ximo: Maior valor na lista.' + sLineBreak +
     '- Soma: Total da soma de todos os n�meros.', mtInformation, [mbOK], 0);
end;

procedure TfrmPrincipal.img02Click(Sender: TObject);
begin
   edt01.Text := '';
   pnl01_03.Visible := False;
end;

procedure TfrmPrincipal.img03Click(Sender: TObject);
var
   FilePath: String;
begin
   if not pnl01_03.Visible then
   begin
      MessageDlg
        ('Ops! Parece que voc� esqueceu de gerar as estat�sticas. Por favor, clique em "Gerar estat�sticas" antes de criar o relat�rio.',
        mtWarning, [mbOK], 0);
      Exit;
   end;

   OpenDialog.InitialDir := ExtractFilePath(Application.ExeName);

   if OpenDialog.Execute then
   begin
      FilePath := OpenDialog.FileName;

      if not DirectoryExists(ExtractFileDir(FilePath)) then
      begin
         MessageDlg
           ('Opa, n�o conseguimos localizar esse diret�rio. Verifique se o caminho est� correto e tente novamente.',
           mtError, [mbOK], 0);
         Exit;
      end;

      GerarRelatorio(FilePath);
   end;
end;

procedure TfrmPrincipal.img04Click(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TfrmPrincipal.img05Click(Sender: TObject);
begin
   if frmSobre = nil then
      frmSobre := TfrmSobre.Create(Application);
   try
      frmSobre.ShowModal;
   finally
      FreeAndNil(frmSobre);
   end;
end;

procedure TfrmPrincipal.pnlGerarClick(Sender: TObject);
var
   Stats: IStatistics;
   ValidationResult: TValidationResult;
   DataArray: TArray<Double>;
begin
   pnl01_03.Visible := False;

   Stats := TStatistics.Create;

   ValidationResult := Stats.SetDataFromString(edt01.Text);

   if ValidationResult = vrEmpty then
   begin
      MessageDlg
        ('Ops! Parece que voc� n�o digitou nenhum n�mero. Por favor, forne�a uma lista de n�meros inteiros separados por v�rgula para continuarmos.',
        mtWarning, [mbOK], 0);
      Exit;
   end
   else if ValidationResult = vrInvalid then
   begin
      MessageDlg
        ('Hmm, parece que encontramos caracteres n�o permitidos. Verifique se voc� digitou apenas n�meros inteiros separados por v�rgula.',
        mtError, [mbOK], 0);
      Exit;
   end;

   DataArray := Stats.GetData;

   lblAVG.Caption := FormatFloat('0.00', Stats.GetMean(DataArray));
   lblMOD.Caption := FormatFloat('0.00', Stats.GetMode(DataArray));
   lblMED.Caption := FormatFloat('0.00', Stats.GetMedian(DataArray));
   lblVAR.Caption := FormatFloat('0.00', Stats.GetVariance(DataArray));
   lblSTD.Caption := FormatFloat('0.00', Stats.GetStandardDeviation(DataArray));
   lblRNG.Caption := FormatFloat('0.00', Stats.GetRange(DataArray));
   lblMIN.Caption := FormatFloat('0.00', Stats.GetMinimum(DataArray));
   lblMAX.Caption := FormatFloat('0.00', Stats.GetMaximum(DataArray));
   lblSUM.Caption := FormatFloat('0.00', Stats.GetSum(DataArray));

   pnl01_03.Visible := True;
end;

end.
