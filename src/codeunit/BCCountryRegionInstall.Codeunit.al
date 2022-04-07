codeunit 50102 "BC Country/Region Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany();
    var
        UpgradeTag: Codeunit "Upgrade Tag";
        myAppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(myAppInfo);

        if myAppInfo.DataVersion = Version.Create(0, 0, 0, 0) then
            HandleFreshInstall()
        else
            HandleReinstall();

        UpgradeTag.SetAllUpgradeTags();
    end;

    procedure HandleFreshInstall();
    var
        BCCountryRegionSetup: Record "BC Country/Region Setup";
    begin
        BCCountryRegionSetup.Init();
        BCCountryRegionSetup.CountryCode := 'JP';
        BCCountryRegionSetup."Country/Region Enum" := BCCountryRegionSetup."Country/Region Enum"::JP;
        if not BCCountryRegionSetup.Insert() then;
    end;

    local procedure HandleReinstall();
    var
        BCCountryRegionSetup: Record "BC Country/Region Setup";
    begin
        BCCountryRegionSetup.Init();
        BCCountryRegionSetup.CountryCode := 'JP';
        BCCountryRegionSetup."Country/Region Enum" := BCCountryRegionSetup."Country/Region Enum"::JP;
        if not BCCountryRegionSetup.Insert() then;
    end;

    //moja nova izmena
}