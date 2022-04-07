codeunit 50100 "BC TestCodeUnit"
{
    /*
    TableNo = Customer;
    trigger OnRun()
    begin
        Message('%1', Rec.Name);
    end;
*/

    TableNo = Customer;
    trigger OnRun()
    begin
        Rec.FindFirst();
        Message('%1, %2', Rec.Name, Rec.Count());
    end;


    procedure Bojana()
    begin
        Message('Pozdrav');
    end;

    var
        bojana1: Integer;

    procedure SetBojana(broj: Integer)
    begin
        bojana1 := broj;
    end;

    procedure GetBojana(): Integer;
    begin
        exit(bojana1);
    end;
}