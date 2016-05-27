<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_KW_Member_Former_RType</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Member_Former</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW Member Former RType</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_KW_Member_RType</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Member_Record</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW Member RType</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_KW_Office_RType</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Officer_Record</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW Office RType</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_KW_Officer_Former_RType</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Officer_Former</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW Officer Former RType</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_KW_Staffer_Former_RType</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Staffer_Former</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW Staffer Former RType</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_KW_Staffer_RType</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Staffer_Record</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW Staffer RType</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Set KW Member Former RType</fullName>
        <actions>
            <name>Set_KW_Member_Former_RType</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.KW_Template__c</field>
            <operation>equals</operation>
            <value>ContactMemberFormer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set KW Member RType</fullName>
        <actions>
            <name>Set_KW_Member_RType</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.KW_Template__c</field>
            <operation>equals</operation>
            <value>ContactMember</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set KW Officer Former RType</fullName>
        <actions>
            <name>Set_KW_Officer_Former_RType</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.KW_Template__c</field>
            <operation>equals</operation>
            <value>ContactOfficerFormer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set KW Officer RType</fullName>
        <actions>
            <name>Set_KW_Office_RType</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.KW_Template__c</field>
            <operation>equals</operation>
            <value>ContactOfficer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set KW Staffer Former RType</fullName>
        <actions>
            <name>Set_KW_Staffer_Former_RType</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.KW_Template__c</field>
            <operation>equals</operation>
            <value>ContactStaffFormer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set KW Staffer RType</fullName>
        <actions>
            <name>Set_KW_Staffer_RType</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.KW_Template__c</field>
            <operation>equals</operation>
            <value>ContactStaff</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
