<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_KW_Caucus_Former_RType</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Caucus_Former</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW Caucus Former RType</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_KW_Caucus_RType</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Caucus</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW Caucus RType</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_KW_Committee_Former_RType</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Committee_Former</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW Committee Former RType</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_KW_Committee_RType</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Account_Committee</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW Committee RType</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_KW_Former_RType</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Former</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW Former RType</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_KW_Member_Former_RType</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Legislative_Member_Former</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW Member Former RType</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_KW_Member_RType</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Account_Member</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW Member RType</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_KW_Office_Former_RType</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Account_Officer_Former</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW Office Former RType</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_KW_Office_RType</fullName>
        <field>RecordTypeId</field>
        <lookupValue>KW_Account_Officer</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set KW Office RType</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Set KW Caucus Former RType</fullName>
        <actions>
            <name>Set_KW_Caucus_Former_RType</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.KW_Template__c</field>
            <operation>equals</operation>
            <value>AccountCaucusFormer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set KW Caucus RType</fullName>
        <actions>
            <name>Set_KW_Caucus_RType</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.KW_Template__c</field>
            <operation>equals</operation>
            <value>AccountCaucus</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set KW Committee Former RType</fullName>
        <actions>
            <name>Set_KW_Committee_Former_RType</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.KW_Template__c</field>
            <operation>equals</operation>
            <value>AccountCommitteeFormer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set KW Committee RType</fullName>
        <actions>
            <name>Set_KW_Committee_RType</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.KW_Template__c</field>
            <operation>equals</operation>
            <value>AccountCommittee</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set KW Former RType</fullName>
        <actions>
            <name>Set_KW_Former_RType</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.KW_Template__c</field>
            <operation>equals</operation>
            <value>AccountFormer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set KW Member Former RType</fullName>
        <actions>
            <name>Set_KW_Member_Former_RType</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.KW_Template__c</field>
            <operation>equals</operation>
            <value>AccountMemberFormer</value>
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
            <field>Account.KW_Template__c</field>
            <operation>equals</operation>
            <value>AccountMember</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set KW Office Former RType</fullName>
        <actions>
            <name>Set_KW_Office_Former_RType</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.KW_Template__c</field>
            <operation>equals</operation>
            <value>AccountOfficerFormer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set KW Office RType</fullName>
        <actions>
            <name>Set_KW_Office_RType</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.KW_Template__c</field>
            <operation>equals</operation>
            <value>AccountOfficer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
