pageextension 50100 "BC CustomerListExt" extends "Customer List"
{
    actions
    {
        addlast("&Customer")
        {
            action("BC CallPublisher")
            {
                ApplicationArea = All;
                ToolTip = 'Porukaaa';
                Image = Find;
                Promoted = true;
                PromotedCategory = Report;

                trigger OnAction()
                begin
                    OnCallPublisher(Rec);
                end;
            }
        }
    }

    [IntegrationEvent(false, false)]
    local procedure OnCallPublisher(var Customer: Record Customer)
    begin
    end;
}