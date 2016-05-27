<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_KW_Account_County_Former_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Local_County_Former</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW Account County Former Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_KW_Account_County_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Local_County</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW Account County Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_KW_Account_Municipal_Former_RT</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Local_Municipal_Former</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW Account Municipal Former RT</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_KW_Account_Municipal_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Local_Municipal</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW Account Municipal Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Set KW Account County Former Record Type</fullName>
        <actions>
            <name>Set_KW_Account_County_Former_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.kw__KW_Template__c</field>
            <operation>equals</operation>
            <value>AccountLocalCountyFormer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set KW Account County Record Type</fullName>
        <actions>
            <name>Set_KW_Account_County_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.kw__KW_Template__c</field>
            <operation>equals</operation>
            <value>AccountLocalCountyUltimate</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set KW Account Municipal Former Record Type</fullName>
        <actions>
            <name>Set_KW_Account_Municipal_Former_RT</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.kw__KW_Template__c</field>
            <operation>equals</operation>
            <value>AccountLocalMunicipalFormer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set KW Account Municipal Record Type</fullName>
        <actions>
            <name>Set_KW_Account_Municipal_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.kw__KW_Template__c</field>
            <operation>equals</operation>
            <value>AccountLocalMunicipalUltimate</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
