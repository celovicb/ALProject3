page 50100 "BC Country/Region SetupPage"
{
    Caption = 'Country/Region Setup';
    PageType = Card;
    SourceTable = "BC Country/Region Setup";
    UsageCategory = Administration;
    ApplicationArea = All;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(CountryRegion; Rec.CountryCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Select Country/Region for your localization';
                    Visible = false;
                }
                field(Name; Rec."Country/Region Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'this is name';
                    Visible = false;
                }
                field(CountryRegionEnum; Rec."Country/Region Enum")
                {

                    ApplicationArea = All;
                    ToolTip = 'Select selected country';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Setup)
            {
                action(UpgradeScript)
                {
                    ApplicationArea = All;
                    ToolTip = 'Run upgrade script.';
                    trigger OnAction()
                    var
                        BCCountryRegionUpgrade: Codeunit "BC Country/Region Upgrade";
                    begin
                        BCCountryRegionUpgrade.Run();
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.FindFirst() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}