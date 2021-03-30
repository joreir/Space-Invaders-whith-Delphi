unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,JPEG,PNGImage, Vcl.StdCtrls,UCnave,
  Vcl.MPlayer;
 const Maxs=10;
type

  TFrmPrincipal = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    MediaPlayer1: TMediaPlayer;
    MediaPlayer2: TMediaPlayer;
    Shape1: TShape;
    Shape2: TShape;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormDblClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormPaint(Sender: TObject);

  private
    { Private declarations }
    Enemigos : Array[1..Maxs] of Nave_ene;
  //  Disparos : Array[1..20] of Nave_ene;
    explosion: array[1..4] of nave_ene;
     Estado_bala:bool;
    Der,Izq,Arb,Abj,Dis : Boolean;
    avion,bala,enemiga : TBitmap;
    fondo : TJPEGImage;
    naves:Nave_ene;
    X,Y,BY,BX,EX,EY,bal,X_explo,Y_explo :Integer;
    distancia:real;
    dim:integer;

    //
    x1,x2,y1,y2,radio_ene,score:integer;
    score_string:string;

     OpenMediaDialog : TOpenDialog;

     expo1,expo2,expo3,expo4 : tbitmap;
     dibujar_explo:boolean;

     distancia_nave:real;
     nav_x,nav_y,radio_nave:integer;
  public
    { Public declarations }
    procedure eliminar_enemigos(pos:integer);
    Function distancias(x1,x2,y1,y2:integer):real;

  end;

var
  FrmPrincipal: TFrmPrincipal;

  k,KE: Integer;

implementation

{$R *.dfm}

function TFrmPrincipal.distancias(x1, x2, y1, y2: integer): real;
Var
  d:real;
begin
 d:= sqrt(sqr(x1-x2)+ sqr(y1-y2));

 Result:=d;
end;

procedure TFrmPrincipal.eliminar_enemigos(pos: integer);
var
  t: Integer;
begin
for t := pos to dim-1 do
  enemigos[t]:=enemigos[t+1];

   Dec(dim);
end;

procedure TFrmPrincipal.FormClick(Sender: TObject);
begin
    //Shape1.Left:= Shape1.Left+5;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
var
  I,t: Integer;
begin
  k:=10;
  KE:=9;
  bal:=1;
  EX:=1;
  dim:=10;
  Estado_bala:=true;
  distancia:=10000;
  score:=0;
  dibujar_explo:=false;
 // naves:= Nave_ene.Create;
  //avion := naves.crear('Avion.BMP');

   avion := TBitmap.Create;
   avion .LoadFromFile('Avion.BMP');
   avion .Transparent:=True;
   avion .TransparentColor:= avion.Canvas.Pixels[1,1];
   avion .TransparentMode:=tmAuto;

  X:= (Screen.Width-Avion.Width) div 2;
  Y:= Screen.Height-Avion.Height;


  fondo:= TJPEGImage.Create;
  fondo.LoadFromFile('ESPACIO.JPG');


    //     bala:= naves.crear('Bala.BMP');
   bala := TBitmap.Create;
   bala .LoadFromFile('Bala.BMP');
   bala .Transparent:=True;
   bala .TransparentColor:= bala.Canvas.Pixels[1,1];
   bala .TransparentMode:=tmAuto;


   expo1 := TBitmap.Create;
   expo1 .LoadFromFile('Explo1.BMP');
   expo1 .Transparent:=True;
   expo1 .TransparentColor:= expo1.Canvas.Pixels[1,1];
   expo1 .TransparentMode:=tmAuto;




  Ex:=1;
  for I := 1 to 5 do
     begin
         enemigos[i]:= nave_ene.Create('enemiga.BMP',EX,60);
         enemigos[i+5]:= nave_ene.Create('enemiga.BMP',EX,220);
         if i=1 then
            shape1.Left:= Ex;
         if i=5 then
            shape2.Left:= Ex + 180;


         Ex:=Ex+300;

     end;

end;

procedure TFrmPrincipal.FormDblClick(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TFrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 // label1.Caption:= IntToStr(key);
  case key of

     37: Izq:=True;
     39: Der:=True;
     38: Arb:=True;
     40: Abj:=True;
     32: if (estado_bala=true) then
          Begin
            estado_bala:=false;
            BY:=Y-Bala.Height;
            BX:=X+((Avion.Width-Bala.Width) div 2);
            mediaplayer2.Stop;
            mediaplayer1.Stop;
            mediaplayer1.Play;
          End;


  end;

end;

procedure TFrmPrincipal.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of

     37: Izq:=false;
     39: Der:=false;
     38: Arb:=false;
     40: Abj:=false;
     32: Dis:=True;

  end;
end;

procedure TFrmPrincipal.FormPaint(Sender: TObject);
Var
i :Integer;
begin

   canvas.StretchDraw(Rect(0,0,Screen.Width,Screen.Height),fondo);
   canvas.Draw(X,Y,Avion);
   If estado_bala=false Then  Canvas.Draw(BX,BY,Bala);
   for I := 1 to dim do
   begin
    canvas.Draw(enemigos[i].obtener_Nx,enemigos[i].obtener_Ny,enemigos[i].obtener_imagen);
   // canvas.Draw(enemigos[i+5].obtener_Nx,enemigos[i+5].obtener_Ny,enemigos[i+5].obtener_imagen);
   end;
   if dibujar_explo=true then
    begin
      canvas.Draw(X_explo,Y_explo,expo1);

    //  canvas.Draw(X_explo,Y_explo,expo2);
    //  canvas.Draw(X_explo,Y_explo,expo3);
    //  canvas.Draw(X_explo,Y_explo,expo4);
       dibujar_explo:=false;
    end;



end;



procedure TFrmPrincipal.Timer1Timer(Sender: TObject);
var
  I: Integer;
begin

     shape1.Left:=shape1.Left+Ke;
     shape2.Left:= shape2.Left + KE;

  // if (Enemigos[5].obtener_Nx >Screen.Width-Enemigos[5].obtener_imagen.Width) or (enemigos[1].obtener_Nx<1)then
   if ( shape2.Left>Screen.Width) or (shape1.Left<1)then
    begin
       KE:=KE*-1;
         for I := 1 to dim do
        begin
            enemigos[i].mover_abajo;


          //  enemigos[i+5].mover_abajo;

            if enemigos[i].obtener_Ny+enemigos[i].obtener_imagen.Height> Screen.Height-avion.Height then
              begin
                 label3.Caption:='Perdiste';
                 label4.Caption:= 'Score:'+ IntToStr(score);
                 KE:=0;
                 estado_bala:=false;
                 k:=0;
              end;


        end;
    end;



     for I := 1 to dim do
     begin
       enemigos[i].movimiento(KE);
   //  enemigos[i+5].movimiento(KE);
   //  enemigos[i].mover_abajo;
  //   enemigos[i+5].mover_abajo;
     end;

     if (Izq=true) and (x>1) then x:= x-k;
     if (Der=true) and (x<Screen.Width-avion.Width) then x:= x+k;
     if (Arb=true) and (y>1) then y:= y-k;
     if (Abj=true) and (y<Screen.Height-avion.Height) then y:= y+k;

    // if (Dis)  then  //cambiar con pos imagen
    if estado_bala=false then
       BY:=BY-70;

    if BY<1-bala.Height then
       estado_bala:=true;
       //desdibujar bala;


     for I := 1 to dim do
     begin
       //posicion del radio actual de la imagen
       x1:= enemigos[i].obtener_Nx + (enemigos[i].obtener_imagen.Width div 2);
       y1:= enemigos[i].obtener_Ny + (enemigos[i].obtener_imagen.Height div 2);
       //Poscion del radio actual de la bala
       x2:= Bx + (Bala.Width div 2);
       y2:= By + (Bala.Height div 2);
       radio_ene:= enemigos[i].obtener_imagen.Height div 2;
       distancia:= distancias(x1,x2,y1,y2);
       nav_x:= x + avion.Width;
       nav_y:= y + avion.Height;
       distancia_nave:= distancias(x1,x2,nav_x,nav_y);
       radio_nave:= (avion.Height div 2)+25;

       if (distancia<radio_ene) and (estado_bala=false) then
         begin
           estado_bala:=true;
           score:=score+10;
           label2.Caption:= 'Score' + IntToStr(score);

           x_explo :=enemigos[i].obtener_Nx;
           y_explo := enemigos[i].obtener_Ny;
             eliminar_enemigos(i);

           mediaplayer1.Stop;
           mediaplayer1.Play;
           dibujar_explo:= true;

           label1.Caption:= 'Enemigos';

         end;
     end;

     Repaint;
     if dim=0 then
       begin
         label3.Height:= Screen.Height div 2;
         label3.Width:= (Screen.Width div 2)-100;
         label3.Caption:= 'Ganaste';
         label4.Caption:='Score:'+ IntToStr(score);
         KE:=0;
       //  estado_bala:=false;
         k:=0;
       end;



end;

end.
