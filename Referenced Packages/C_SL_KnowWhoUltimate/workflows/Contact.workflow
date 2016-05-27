<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_KW_County_Former_RT</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Local_County_Former</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW County Former RT</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_KW_County_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Local_County</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW County Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_KW_Municipal_Former_RT</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Local_Municipal_Former</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW Municipal Former RT</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_KW_Municipal_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Local_Municipal</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW Municipal Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Set KW County Former</fullName>
        <actions>
            <name>Set_KW_County_Former_RT</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.kw__KW_Template__c</field>
            <operation>equals</operation>
            <value>ContactLocalCountyFormer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set KW County Ultimate</fullName>
        <actions>
            <name>Set_KW_County_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.kw__KW_Template__c</field>
            <operation>equals</operation>
            <value>ContactLocalCountyUltimate</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set KW Municipal Former</fullName>
        <actions>
            <name>Set_KW_Municipal_Former_RT</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.kw__KW_Template__c</field>
            <operation>equals</operation>
            <value>ContactLocalMunicipalFormer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set KW Municipal Ultimate</fullName>
        <actions>
            <name>Set_KW_Municipal_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.kw__KW_Template__c</field>
            <operation>equals</operation>
            <value>ContactLocalMunicipalUltimate</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
