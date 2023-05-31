/// REST services to deal with files & streams
Class OPNEx.Rest.Service.fileDispatch Extends %CSP.REST
{

Parameter CHARSET = "iso-8859-1";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
    <!--<Route Url="/file/:id" Method="GET" Call="GetFile" Cors="true"/>-->
    <Route Url="/file" Method="POST" Call="AddFile" Cors="true"/>
    <Route Url="/echo" Method="GET" Call="GetEcho" Cors="true"/>    </Routes>
}

/// Añadir un fichero
ClassMethod AddFile() As %Status
{
    #dim sc as %Status = $$$OK
    #dim %request as %CSP.Request
    #dim tObj as OPNEx.Rest.Data.FileStore = ##class(OPNEx.Rest.Data.FileStore).%New()
    // Asumimos que se nos pasa un JSON correcto
    //#dim tStream as %Stream.GlobalBinary = ##class(%Stream.GlobalBinary).%New()
    
    //zw %request

    do tObj.FileStored.CopyFrom(%request.Content)
    //write !,"Size: "_tObj.FileStored.Size

    set sc = tObj.%Save()

    Return sc
}

ClassMethod GetEcho() As %Status
{
    write !,"Echo message - "_$ZDATETIME($h,3)

    return 1
}

}
