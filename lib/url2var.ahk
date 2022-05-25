URLDownloadToVar(url){
    if(!regExMatch(url,"i)https?://"))
        url:="https://" url
    hObject:=ComObjCreate("WinHttp.WinHttpRequest.5.1")
    hObject.Open("GET",url)
    hObject.Send()
    return hObject.ResponseText
}

url2var(url) {
	return URLDownloadToVar(url)
}