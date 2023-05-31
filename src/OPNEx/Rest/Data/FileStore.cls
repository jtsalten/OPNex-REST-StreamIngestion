Class OPNEx.Rest.Data.FileStore Extends %Persistent
{

/// Code - identity
Property FileID As %Integer [ Identity ];

Property FileStored As %Stream.GlobalBinary;

/// Description
Index IdxFileID On FileID [ IdKey, Unique ];

ClassMethod SendFile(pID As %Integer) As %Status
{
    #dim tSC as %Status = $$$OK
    #dim tHttp as %Net.HttpRequest = ##class(%Net.HttpRequest).%New()
    #dim tObj as OPNEx.Rest.Data.FileStore = ##class(OPNEx.Rest.Data.FileStore).%OpenId(pID)

    set tHttp.Server = "localhost"
    set tHttp.Port = 52774

    if $IsObject(tObj)
    {
        set tSC = tHttp.EntityBody.CopyFrom(tObj.FileStored)
        set:tSC tSC = tHttp.Post("/testrest/file")
    }    

    return tSC
}

/// File
Storage Default
{
<Data name="FileStoreDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FileStored</Value>
</Value>
</Data>
<DataLocation>^OPNEx.Rest.Data.FileStoreD</DataLocation>
<DefaultData>FileStoreDefaultData</DefaultData>
<Description>
<![CDATA[File]]></Description>
<IdLocation>^OPNEx.Rest.Data.FileStoreD</IdLocation>
<IndexLocation>^OPNEx.Rest.Data.FileStoreI</IndexLocation>
<StreamLocation>^OPNEx.Rest.Data.FileStoreS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
