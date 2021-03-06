unit uMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Ani, FMX.Effects, FMX.Platform,
  FMX.Controls.Presentation, uConfig, FMX.MultiView, FMX.Layouts, FMX.ListBox;

type
  TMenuForm = class(TForm)
    PlayBTN: TButton;
    Image1: TImage;
    GroundA: TImage;
    Ground: TRectangle;
    Image2: TImage;
    Rectangle1: TRectangle;
    LogoLBL: TLabel;
    GlowEffect3: TGlowEffect;
    FMonkeyA: TImage;
    FloatAnimation1: TFloatAnimation;
    swtchSom: TSwitch;
    lblSom: TLabel;
    layPrincipal: TLayout;
    tlbControle: TToolBar;
    btnMenu: TButton;
    btnFechar: TButton;
    MultiView: TMultiView;
    pnlTop: TPanel;
    pnlBottom: TPanel;
    imgMonkey: TImage;
    lstMenu: TListBox;
    lstItem1: TListBoxItem;
    lblTitulo: TLabel;
    GlowEffect1: TGlowEffect;
    procedure PlayBTNClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure swtchSomSwitch(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }


  public
    function HandleAppEvent(AAppEvent: TApplicationEvent;
      AContext: TObject): Boolean;
  end;

var
  MenuForm: TMenuForm;

implementation

{$R *.fmx}

uses uGame, uDmStyle;

procedure TMenuForm.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TMenuForm.FormCreate(Sender: TObject);
begin
{$IFDEF MSWINDOWS}
  BorderStyle := TFmxFormBorderStyle.bsSizeable;
  MultiView1.Visible := False;
{$ELSE}
  // BorderStyle:= TFmxFormBorderStyle.None; {BUG}

  FSingletonConfig.SetFullScren(Self);
{$ENDIF}
  swtchSom.IsChecked := FSingletonConfig.SomLigado;
end;

procedure TMenuForm.PlayBTNClick(Sender: TObject);
begin
  GameForm.Run;
  MenuForm.Hide;
{$IFDEF MSWINDOWS}
  GameForm.ShowModal;
{$ELSE}
  GameForm.Show;
{$ENDIF}
end;

procedure TMenuForm.swtchSomSwitch(Sender: TObject);
begin
  if swtchSom.IsChecked then
    FSingletonConfig.LigaSom
  else
    FSingletonConfig.DesligaSom;
end;

function TMenuForm.HandleAppEvent(AAppEvent: TApplicationEvent;
  AContext: TObject): Boolean;
begin
  case AAppEvent of
    TApplicationEvent.FinishedLaunching:
      begin
      end;
    TApplicationEvent.BecameActive:
      begin
      end;
    TApplicationEvent.WillBecomeInactive:
      begin
      end;
    TApplicationEvent.EnteredBackground:
      begin
      end;
    TApplicationEvent.WillBecomeForeground:
      begin
      end;
    TApplicationEvent.WillTerminate:
      begin
      end;
    TApplicationEvent.LowMemory:
      begin
      end;
    TApplicationEvent.TimeChange:
      begin
      end;
    TApplicationEvent.OpenURL:
      begin
      end;
  end;
  Result := True;
end;

end.
