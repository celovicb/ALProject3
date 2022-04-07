codeunit 50103 "BC Country/Region Upgrade"
{
    //Subtype = Upgrade;

    trigger OnRun()
    begin
        PerformUpgrade();
    end;
    /*
        trigger OnUpgradePerCompany()
        var
            UpgradeTag: Codeunit "Upgrade Tag";
        begin
            if UpgradeTag.HasUpgradeTag(ReasonLbl) then exit;

            PerformUpgrade();

            UpgradeTag.SetUpgradeTag(ReasonLbl);
        end;
    */
    local procedure PerformUpgrade()
    var
        BCCountryRegionSetup: Record "BC Country/Region Setup";
        BCCountryRegionInstall: Codeunit "BC Country/Region Install";
    begin
        if not BCCountryRegionSetup.FindFirst() then
            BCCountryRegionInstall.HandleFreshInstall()
        else begin
            case BCCountryRegionSetup.CountryCode of
                'RS':
                    BCCountryRegionSetup."Country/Region Enum" := BCCountryRegionSetup."Country/Region Enum"::RS;
                'CR':
                    BCCountryRegionSetup."Country/Region Enum" := BCCountryRegionSetup."Country/Region Enum"::CR;
                'JP':
                    BCCountryRegionSetup."Country/Region Enum" := BCCountryRegionSetup."Country/Region Enum"::JP;
                else
                    BCCountryRegionSetup."Country/Region Enum" := BCCountryRegionSetup."Country/Region Enum"::JP;
            end;
            BCCountryRegionSetup.Modify();
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Upgrade Tag", 'OnGetPerCompanyUpgradeTags', '', false, false)]
    local procedure OnGetPerCompanyUpgradeTags(var PerCompanyUpgradeTags: List of [Code[250]]);
    begin
        PerCompanyUpgradeTags.Add(ReasonLbl);
    end;


    var
        ReasonLbl: Label 'BeTerna-SetupEnum-20220406', Locked = true;
}