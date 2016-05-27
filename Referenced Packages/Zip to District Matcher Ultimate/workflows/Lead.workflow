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
        <fullName>Update_City_with_USPS_Verified_Addres</fullName>
        <field>City</field>
        <formula>USPS_City__c</formula>
        <name>Update City with USPS Verified Addres</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_State_with_USPS_Verified_Addres</fullName>
        <field>State</field>
        <formula>USPS_State__c</formula>
        <name>Update State with USPS Verified Addres</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Street_with_USPS_Verified_Addres</fullName>
        <field>Street</field>
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
        <field>PostalCode</field>
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
        <fullName>ZDM_Lead_County_Code</fullName>
        <field>KW_CountyCode__c</field>
        <name>ZDM:Lead:County Code</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Lead_County_Name</fullName>
        <field>KW_CountyName__c</field>
        <name>ZDM:Lead:County Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Lead_Error_Code</fullName>
        <field>KW_Error_Code__c</field>
        <name>ZDM:Lead:Error Code</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Lead_House</fullName>
        <field>KW_USHouseDistrict__c</field>
        <name>ZDM:Lead:House</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Lead_Latitude</fullName>
        <field>Latitude__c</field>
        <name>ZDM:Lead:Latitude</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Lead_Longitude</fullName>
        <field>Longitude__c</field>
        <name>ZDM:Lead:Longitude</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Lead_Muni_Code</fullName>
        <field>KW_MunicipalCode__c</field>
        <name>ZDM:Lead:Municipal Code</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Lead_Muni_Name</fullName>
        <field>KW_MunicipalName__c</field>
        <name>ZDM:Lead:Municipal Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Lead_Muni_Type</fullName>
        <field>KW_MunicipalType__c</field>
        <name>ZDM:Lead:Municipal Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Lead_PO_Box_Reset</fullName>
        <field>PO_Box__c</field>
        <literalValue>0</literalValue>
        <name>ZDM:Lead:PO Box Reset</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Lead_Senate</fullName>
        <field>KW_USSenateDistrict__c</field>
        <name>ZDM:Lead:Senate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Lead_State_House</fullName>
        <field>KW_StateHouseDistrict__c</field>
        <name>ZDM:Lead:State House</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Lead_State_Senate</fullName>
        <field>KW_StateSenateDistrict__c</field>
        <name>ZDM:Lead:State Senate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ZDM_Lead_Zip_4_Reset</fullName>
        <field>Zip_4__c</field>
        <name>ZDM:Lead:Zip 4 Reset</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Reset ZDM Lead Descr Fields on Address Update</fullName>
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
        <formula>AND (   OR( ISCHANGED( Street),   ISCHANGED( City),  ISCHANGED( State),   ISCHANGED( PostalCode)   ),  KnowWho_Address_Update__c = FALSE  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Reset ZDM Lead Fields on Address Update</fullName>
        <actions>
            <name>Reset_Last_Processed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Lead_Error_Code</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Lead_Latitude</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Lead_Longitude</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Lead_PO_Box_Reset</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Lead_Zip_4_Reset</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Reset ZDM Lead Fields on address change</description>
        <formula>AND (   OR( ISCHANGED( Street),   ISCHANGED( City),  ISCHANGED( State),   ISCHANGED( PostalCode)   ),  KnowWho_Address_Update__c = FALSE  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Reset ZDM Lead Fields on Address Update %282%29</fullName>
        <actions>
            <name>ZDM_Lead_County_Code</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Lead_County_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Lead_House</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Lead_Muni_Code</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Lead_Muni_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Lead_Muni_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Lead_Senate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Lead_State_House</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ZDM_Lead_State_Senate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Reset ZDM Fields when address changes</description>
        <formula>AND (   OR( ISCHANGED( Street),   ISCHANGED( City),  ISCHANGED( State),   ISCHANGED( PostalCode)   ),  KnowWho_Address_Update__c = FALSE  )</formula>
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
            <field>Lead.USPS_Verified__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.KnowWho_Address_Update__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Use USPS Verified Address from KnowWho ZDM Process to update standard address fields</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
