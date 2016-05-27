<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>KW_CountyDistrict</fullName>
        <field>KW_CountyDistrict__c</field>
        <name>ZDM:Account:County District</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>KW_CountyDistrictDesc</fullName>
        <field>KW_CountyDistrictDesc__c</field>
        <name>ZDM:Account:County District Desc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>KW_MunicipalDistrict</fullName>
        <field>KW_MunicipalDistrict__c</field>
        <name>ZDM:Account:Municipal District</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>KW_MunicipalDistrictDesc</fullName>
        <field>KW_MunicipalDistrictDesc__c</field>
        <name>ZDM:Account:Municipal District Desc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>KW_StateHouseDesc</fullName>
        <field>KW_StateHouseDesc__c</field>
        <name>ZDM:Account:State House Desc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>KW_StateSenateDesc</fullName>
        <field>KW_StateSenateDesc__c</field>
        <name>ZDM:Account:State Senate Desc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>KW_USHouseDesc</fullName>
        <field>KW_USHouseDesc__c</field>
        <name>ZDM:Account:US House Desc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>KW_USSenateDesc</fullName>
        <field>KW_USSenateDesc__c</field>
        <name>ZDM:Account:US Senate Desc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_KnowWho_Address_Flag</fullName>
        <field>KnowWho_Address_Update__c</field>
        <literalValue>0</literalValue>
        <name>Reset KnowWho Address Flag</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Last_Processed_Date</fullName>
        <field>KWD_Last_Processed_DT__c</field>
        <name>Reset Last Processed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Processed_Date_Contact</fullName>
        <field>KWD_Last_Processed_DT__c</field>
        <name>Reset Processed Date (Contact)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_City_with_USPS_Verified_Addres</fullName>
        <field>MailingCity</field>
        <formula>USPS_City__c</formula>
        <name>Update City with USPS Verified Addres</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_State_with_USPS_Verified_Addres</fullName>
        <field>MailingState</field>
        <formula>USPS_State__c</formula>
        <name>Update State with USPS Verified Addres</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Street_with_USPS_Verified_Addres</fullName>
        <field>MailingStreet</field>
        <formula>IF(ISBLANK(USPS_Street_2__c),
USPS_Street__c,
USPS_Street__c &amp; &quot;, &quot; &amp; USPS_Street_2__c
)</formula>
        <name>Update Street with USPS Verified Addres</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Zipcode_with_USPS_Verified_Addres</fullName>
        <field>MailingPostalCode</field>
        <formula>USPS_Zip__c</formula>
        <name>Update Zipcode with USPS Verified Addres</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Account_County_Name</fullName>
        <field>KW_CountyName__c</field>
        <name>ZDM:Account:County Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Contact_County_Code</fullName>
        <field>KW_CountyCode__c</field>
        <name>ZDM:Contact:County Code</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Contact_County_Name</fullName>
        <field>KW_CountyName__c</field>
        <name>ZDM:Contact:County Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Contact_Error_Code</fullName>
        <field>KW_Error_Code__c</field>
        <name>ZDM:Contact:Error Code</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Contact_House</fullName>
        <field>KW_USHouseDistrict__c</field>
        <name>ZDM:Contact:House</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Contact_Latitude</fullName>
        <field>Latitude__c</field>
        <name>ZDM:Contact:Latitude</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Contact_Longitude</fullName>
        <field>Longitude__c</field>
        <name>ZDM:Contact:Longitude</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Contact_Muni_Code</fullName>
        <field>KW_MunicipalCode__c</field>
        <name>ZDM:Contact:Municipal Code</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Contact_Muni_Name</fullName>
        <field>KW_MunicipalName__c</field>
        <name>ZDM:Contact:Municipal Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Contact_Muni_Type</fullName>
        <field>KW_MunicipalType__c</field>
        <name>ZDM:Contact:Municipal Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Contact_PO_Box_Reset</fullName>
        <field>PO_Box__c</field>
        <literalValue>0</literalValue>
        <name>ZDM:Contact:PO Box Reset</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Contact_Senate</fullName>
        <field>KW_USSenateDistrict__c</field>
        <name>ZDM:Contact:Senate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Contact_State_House</fullName>
        <field>KW_StateHouseDistrict__c</field>
        <name>ZDM:Contact:State House</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Contact_State_Senate</fullName>
        <field>KW_StateSenateDistrict__c</field>
        <name>ZDM:Contact:State Senate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Contact_Zip_4_Reset</fullName>
        <field>Zip_4__c</field>
        <name>ZDM:Contact:Zip 4 Reset</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Reset Processed Date %28Contact%29</fullName>
        <actions>
            <name>Reset_Last_Processed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Reset_Processed_Date_Contact</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Contact_Error_Code</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Contact_Latitude</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Contact_Longitude</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Contact_PO_Box_Reset</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Contact_Zip_4_Reset</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Reset ZDM System Fields when address changed</description>
        <formula>AND (   OR( ISCHANGED( MailingStreet),  ISCHANGED( MailingCity),  ISCHANGED( MailingState),  ISCHANGED( MailingPostalCode)  ),   KnowWho_Address_Update__c = FALSE  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Reset ZDM Contact Descr Fields on Address Update</fullName>
        <actions>
            <name>KW_CountyDistrict</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>KW_CountyDistrictDesc</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>KW_MunicipalDistrict</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>KW_MunicipalDistrictDesc</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>KW_StateHouseDesc</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>KW_StateSenateDesc</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>KW_USHouseDesc</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>KW_USSenateDesc</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Reset ZDM Description Fields when address changed</description>
        <formula>AND (  OR(  ISCHANGED( MailingStreet),   ISCHANGED( MailingCity),    ISCHANGED( MailingState),    ISCHANGED( MailingPostalCode)    ),   KnowWho_Address_Update__c = FALSE )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Reset ZDM Contact Fields on Address Update</fullName>
        <actions>
            <name>ZDM_Contact_County_Code</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Contact_County_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Contact_House</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Contact_Muni_Code</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Contact_Muni_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Contact_Muni_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Contact_Senate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Contact_State_House</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Contact_State_Senate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Reset ZDM Fields when address changed</description>
        <formula>AND (   OR( ISCHANGED( MailingStreet),  ISCHANGED( MailingCity),  ISCHANGED( MailingState),  ISCHANGED( MailingPostalCode)  ),   KnowWho_Address_Update__c = FALSE  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Address with USPS Verified Address</fullName>
        <actions>
            <name>Reset_KnowWho_Address_Flag</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_City_with_USPS_Verified_Addres</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_State_with_USPS_Verified_Addres</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Street_with_USPS_Verified_Addres</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Zipcode_with_USPS_Verified_Addres</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.USPS_Verified__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.KnowWho_Address_Update__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Use USPS Verified Address from KnowWho ZDM Process to update standard address fields</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
