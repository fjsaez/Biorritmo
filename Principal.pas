unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, DateUtils, Math, JvComponentBase,
  JvEnterTab, JvExExtCtrls, JvBevel, JvDSADialogs, JvBaseDlg, JvWinDialogs,
  JvExtComponent, JvTMTimeLine;

type
  TFPrinc = class(TForm)
    DTPFNac: TDateTimePicker;
    Label1: TLabel;
    CBHoy: TCheckBox;
    DTPOFecha: TDateTimePicker;
    LOFecha: TLabel;
    BCalcular: TButton;
    GroupBox1: TGroupBox;
    LCantDias: TLabel;
    LEdad: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Timer1: TTimer;
    CheckBox1: TCheckBox;
    Label5: TLabel;
    LFecha: TLabel;
    JvBevel1: TJvBevel;
    LFIni: TLabel;
    LFFin: TLabel;
    LCFis: TLabel;
    LCEmo: TLabel;
    LCInt: TLabel;
    LCInc: TLabel;
    PB1: TPaintBox;
    JvEnterAsTab1: TJvEnterAsTab;
    procedure FormShow(Sender: TObject);
    procedure CBHoyClick(Sender: TObject);
    procedure BCalcularClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure PB1Paint(Sender: TObject);
  private
    { Private declarations }
    procedure DibujarOnda(DiasVida,DiasCiclo: integer; ColorLinea: TColor);
    procedure CalcularBio;
  public
    { Public declarations }
  end;

var
  FPrinc: TFPrinc;
  PropX,PropY,MitadHPB,AltoScr,AnchoScr,NumDias: integer;
  Bio: array [0..29] of TPoint;

implementation

{$R *.dfm}

procedure TFPrinc.DibujarOnda(DiasVida,DiasCiclo: integer; ColorLinea: TColor);
var
  I,Cont: integer;

function Leyenda(Valor: integer): string;
var
  Cad: string;  ValY: integer;
begin
  if Valor<=MitadHPB then Cad:='+'
                     else Cad:='-';
  if Valor>MitadHPB-1 then ValY:=Valor-MitadHPB
                      else ValY:=MitadHPB-Valor;
  Cad:=Cad+IntToStr(Round(ValY*100/MitadHPB))+'% ';
  if Bio[16].Y<Valor then Cad:=Cad+'Subiendo'
                     else Cad:=Cad+'Bajando';
  Result:=Cad;
end;

begin
  PB1.Canvas.Pen.Color:=ColorLinea;
  PB1.Canvas.Pen.Width:=2;
  //se carga el array:
  DiasVida:=DiasVida-(Length(Bio) div 2)-1; //toma datos de 14 días antes y 14 después
  Cont:=0;
  for I:=0 to High(Bio) do
  begin
    Bio[I].X:=I*PropX;
    Inc(Cont,1);
    Bio[I].Y:=AltoScr-Round(RadToDeg(Sin(2*Pi/DiasCiclo*(DiasVida+Cont))*PropY)+MitadHPB);
  end;
  PB1.Canvas.Polyline(Bio);  //se dibuja como tal
  case DiasCiclo of
    23: LCFis.Caption:=Leyenda(Bio[15].Y);
    28: LCEmo.Caption:=Leyenda(Bio[15].Y);
    33: LCInt.Caption:=Leyenda(Bio[15].Y);
    39: LCInc.Caption:=Leyenda(Bio[15].Y);
  end;
end;

procedure TFPrinc.CalcularBio;
var
  Fecha2: TDate;  I,PropH: integer;  VRect: TRect;
begin
  //se calcula la cantidad de días entre fecha de nacimiento y fecha escogida:
  if CBHoy.Checked then Fecha2:=Date
                   else Fecha2:=DTPOFecha.Date;
  NumDias:=DaysBetween(Fecha2,DTPFNac.Date);
  //los datos generales:
  LCantDias.Caption:='- Días entre '+DateToStr(DTPFNac.Date)+
              ' y '+DateToStr(Fecha2)+': '+IntToStr(NumDias);
  LEdad.Caption:='- Edad: '+IntToStr(YearsBetween(Fecha2,DTPFNac.Date));
  LFecha.Caption:=DateToStr(Fecha2);
  LFIni.Caption:=DateToStr(Fecha2-14);
  LFFin.Caption:=DateToStr(Fecha2+13);
  with PB1.Canvas do
  begin
    //relleno del paintbox:
    Brush.Color:=clWhite;
    Brush.Style:=bsSolid;
    VRect.Left:=0;
    VRect.Top:=0;
    VRect.Right:=AnchoScr;
    VRect.Bottom:=AltoScr;
    FillRect(VRect);
    //dibujo de líneas horizontales:
    Pen.Color:=clGray;
    Pen.Style:=psDot;
    Pen.Width:=1;
    PropH:=AltoScr div 20;
    MoveTo(0,0);
    LineTo(AnchoScr,0);  //primera línea
    for I:=1 to 20 do
    begin
      MoveTo(0,I*PropH+2);
      LineTo(AnchoScr,I*PropH+2);
    end;
    //dibujo de líneas verticales:
    for I:=1 to 29 do
    begin
      if I in [1,15,28] then     //para dibujar el eje y negro
      begin
        Pen.Color:=clBlack;
        Pen.Style:=psSolid;
        Pen.Width:=2;
      end
      else                       //para el resto de ejes y grises
      begin
        Pen.Color:=clGray;
        Pen.Style:=psDot;
        Pen.Width:=1;
      end;
      MoveTo(PropX*I,0);
      LineTo(PropX*I,AltoScr);
    end;
    Pen.Color:=clBlack;
    Pen.Style:=psSolid;
    Pen.Width:=2;
    MoveTo(0,MitadHPB);
    LineTo(AnchoScr,MitadHPB); //horizontal o eje x
  end;  {with}
  //se dibujan las ondas senoidales:
  DibujarOnda(NumDias,23,clRed);    //físico
  DibujarOnda(NumDias,28,clBlue);   //emocional
  DibujarOnda(NumDias,33,clGreen);  //intelectual
  DibujarOnda(NumDias,39,clMaroon); //intuicional
end;

procedure TFPrinc.BCalcularClick(Sender: TObject);
begin
  CalcularBio;
end;

procedure TFPrinc.CBHoyClick(Sender: TObject);
begin
  LOFecha.Enabled:=not CBHoy.Checked;
  DTPOFecha.Enabled:=not CBHoy.Checked;
end;

procedure TFPrinc.CheckBox1Click(Sender: TObject);
begin
  CBHoy.Checked:=not CheckBox1.Checked;
  CBHoy.Enabled:=not CheckBox1.Checked;
  Timer1.Enabled:=CheckBox1.Checked;
  BCalcular.Enabled:=not CheckBox1.Checked;
end;

procedure TFPrinc.FormShow(Sender: TObject);
begin
  FormatSettings.ShortDateFormat:='dd/mm/yyyy';
  DTPFNac.Date:=Date;    //fecha de nacimiento
  DTPOFecha.Date:=Date;  //fecha posterior
  CBHoy.Caption:='Hoy ('+DateToStr(Date)+')';
  AltoScr:=PB1.Height;
  AnchoScr:=PB1.Width;
  MitadHPB:=AltoScr div 2;
  PropX:=AnchoScr div High(Bio);
  PropY:=3;  //AltoScr div 100;
  Color:=$00DED8CF;      //color del form
  DTPFNac.SetFocus;
end;

procedure TFPrinc.PB1Paint(Sender: TObject);
begin
  CalcularBio;
end;

procedure TFPrinc.Timer1Timer(Sender: TObject);
begin
  DTPOFecha.Date:=DTPOFecha.Date+1;
  CalcularBio;
end;

end.
